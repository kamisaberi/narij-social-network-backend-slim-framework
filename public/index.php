<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Http\UploadedFile;


require '../vendor/autoload.php';
require_once '../classes/datasource/MemberDataSource.inc';
require_once '../classes/datasource/LoginDataSource.inc';

$app = new \Slim\App([
    'settings' => [
        'displayErrorDetails' => true
    ]
]);

$container = $app->getContainer();
$container['upload_directory'] = 'uploads';

//function to check parameters
function isTheseParametersAvailable($required_fields)
{
    $error = false;
    $error_fields = "";
    $request_params = $_REQUEST;

    foreach ($required_fields as $field) {
        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
            $error = true;
            $error_fields .= $field . ', ';
        }
    }

    if ($error) {
        $response = array();
        $response["error"] = true;
        $response["message"] = 'Required field(s) ' . substr($error_fields, 0, -2) . ' is missing or empty';
        echo json_encode($response);
        return false;
    }
    return true;
}

function moveUploadedFile($directory, UploadedFile $uploadedFile)
{
    $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
    $basename = bin2hex(rand(10000, 99999)); // see http://php.net/manual/en/function.random-bytes.php
//    $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
    $filename = sprintf('%s.%0.8s', $basename, $extension);

    $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

    return $filename;
}


$app->post("/upload", function (Request $request, Response $response) {

    $directory = $this->get('upload_directory');
    $uploadedFiles = $request->getUploadedFiles();
    // handle single input with single file upload
    $uploadedFile = $uploadedFiles['example1'];
    if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
        $filename = moveUploadedFile($directory, $uploadedFile);
        $response->write('uploaded ' . $filename . '<br/>');
    }

});


//    @FormUrlEncoded
//    @POST("authenticate")
//    Call < WebServiceMessage> authenticate(@Field("token") String phone,@Field("ip") String ip);

$app->post("/authenticate", function (Request $request, Response $response) {
    require_once '../classes/datasource/LoginDataSource.inc';
    if (isTheseParametersAvailable(array('token'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        //$ip = $requestData['ip'];
        $ip = $_SERVER["REMOTE_ADDR"];
        $lds = new LoginDataSource();
        $lds->open();
        $res = $lds->authenticate($token, $ip);
        $lds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = trim($res);
        $response->getBody()->write(json_encode($res1));
    }


});


//    @FormUrlEncoded
//    @POST("register/enterPhoneNumber")
//    Call < WebServiceMessage> enterPhoneNumber(@Field("phone") String phone);
$app->post("/register/enterPhoneNumber", function (Request $request, Response $response) {


    require_once '../classes/sms/SmsSender.inc';

    if (isTheseParametersAvailable(array('phone'))) {
        $requestData = $request->getParsedBody();
        $ver = rand(10000, 99999);
        $phone = $requestData['phone'];
        $member = new Member();
        $member->setPhone($phone);
        $member->setVerificationCode($ver);
        $mds = new MemberDataSource();
        $mds->open();
        $id = $mds->enterPhoneNumber($member);
        $mds->close();

        //echo "ID : $id";
        if ($id > 0) {
            $sms = new SmsSender();
            //$res1 = $sms->enqueueSample($phone, "your Verification Code is $ver");
            //echo $res1;
            $res = array();
            $res["error"] = false;
            $res["message"] = $ver;
            //echo json_encode($response);
            $response->getBody()->write(json_encode($res));
        } else {
            $res = array();
            $res["error"] = true;
            $res["message"] = "error";
            $response->getBody()->write(json_encode($res));
        }
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));
    }

});

//    @FormUrlEncoded
//    @POST("register/confirmVerificationCode")
//    Call<WebServiceMessage> enterVerificationCode(@Field("phone") String phone, @Field("verificationCode") String verificationCode);
$app->post("/register/confirmVerificationCode", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone', 'verificationCode'))) {
        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        $verificationCode = $requestData['verificationCode'];

        $mds = new MemberDataSource();
        $mds->open();
        $member = new Member();
        $member->setVerificationCode($verificationCode);
        $member->setPhone($phone);

        $res = $mds->checkVerificationCode($member);
        $mds->close();


        $res1 = array();

        if ($res == true) {
            $res1["error"] = false;
            $res1["message"] = "successful";
        } else {
            $res1["error"] = true;
            $res1["message"] = "failed";

        }
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));
        //echo json_encode($response);
        $response->getBody()->write(json_encode($res1));
    }

});


//    @FormUrlEncoded
//    @POST("register/createPassword")
//    Call < WebServiceMessage> createPassword(@Field("token") String token, @Field("password") String password);

$app->post("/register/createPassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone', 'password'))) {
        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        $password = $requestData['password'];

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setPhone($phone);
        $member->setPassword($password);

        $mds->createPassword($member);
        $mds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";

        //echo json_encode($response);
        $response->getBody()->write(json_encode($res1));

    }

});


//    @FormUrlEncoded
//    @POST("profile/get")
//    Call < WebServiceMessage> getProfile(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/profile/get", function (Request $request, Response $response) {

    require_once '../classes/datasource/MemberDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';
    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/PostDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'memberId'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $memberId = $requestData['memberId'];
        if ($memberId == 0) {
            $lds = new LoginDataSource();
            $lds->open();
            $memberId = $lds->getMemberIdBasedOnToken($token);
            $lds->close();
        }
        $mds = new MemberDataSource();
        $mds->open();
        $member = new Member();
        $member = $mds->getProfile($memberId);
        $mds->close();
        $res1 = array();
//        if ($member->getMemberId() > 0) {
//
//
//
//
//        }
//        } else {
//            $response["error"] = true;
//            $response["message"] = "meber not found";
//        }

        $res1['memberId'] = $member->getMemberId();
        $res1['fullName'] = $member->getFullName();
        $res1['phone'] = $member->getPhone();
        $res1['email'] = $member->getEmail();

        $pds = new PostDataSource();
        $pds->open();
        $res1['postsCount'] = $pds->getMemberPostsCount($memberId);
        $psts = $pds->getMemberPosts($memberId, false);
        $pds->close();

        $posts = array();
        foreach ($psts as $pst) {
            $post = array();
            $post["postId"] = $pst->getPostId();
            $post["title"] = $pst->getTitle();
            $post["description"] = $pst->getDescription();
            $post["description"] = $pst->getDescription();
            $post["deleteTime"] = $post->getDeleteTime();
            $post["createTime"] = $post->getCreateTime();
            $post["editTime"] = $post->getEditTime();
            array_push($posts, $post);
        }
        $res1["posts"] = json_encode(array($posts));


        $fds = new FollowDataSource();
        $fds->open();
        $res1['followingsCount'] = $fds->getFollowingsCount($memberId);
        $flwings = $fds->getFollowings($memberId);
        $followings = array();
        foreach ($flwings as $flwing) {
            $following = array();
            $following["followId"] = $flwing->getFollowId();
            $following["member"] = $flwing->getMember();
            $following["object"] = $flwing->getObject();
            $following["objectType"] = $flwing->getObjectType();
            $following["situation"] = $flwing->getSituation();
            $following["time"] = $flwing->getTime();
            array_push($followings, $following);
        }
        $res1["followings"] = json_encode(array($followings));

        $res1['followersCount'] = $fds->getFollowersRequests($memberId);

        $flwers = $fds->getFollowers($memberId);
        $followers = array();
        foreach ($flwers as $flwer) {
            $follower = array();
            $follower["followId"] = $flwer->getFollowId();
            $follower["member"] = $flwer->getMember();
            $follower["object"] = $flwer->getObject();
            $follower["objectType"] = $flwer->getObjectType();
            $follower["situation"] = $flwer->getSituation();
            $follower["time"] = $flwer->getTime();
            array_push($followers, $following);
        }
        $res1["followers"] = json_encode(array($followers));


        $fds->close();
        $response->getBody()->write(json_encode($res1));
    }

});

//    @FormUrlEncoded
//    @POST("profile/set")
//    Call < WebServiceMessage> setProfileDetail(@Field("token") String token, @Field("fullName") String fullName, @Field("email") String email, @Field("location") String location, @Field("photo") String photo);

$app->post("/profile/set", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'fullName', 'email', 'location', 'photo'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $fullName = $requestData['fullName'];
        $email = $requestData['email'];

        $member = new Member();
        $member->setEmail($email);
        $member->setFullName($fullName);
        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfile($token, $member);
        $mds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));
    }

});

//    @FormUrlEncoded
//    @POST("profile/set/email")
//    Call < WebServiceMessage> setProfileEmail(@Field("token") String token, @Field("email") String email);
$app->post("/profile/set/email", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone', 'email'))) {

        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        $email = $requestData['email'];

        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfileEmail($phone, $email);
        $mds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));

    }

});


//    @FormUrlEncoded
//    @POST("profile/confirm/email")
//    Call<WebServiceMessage> confirmEmail(@Field("token") String token, @Field("verificationCode") String verificationCode);

$app->post("/profile/confirm/email", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'verificationCode'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        //echo json_encode($response);
        $response->getBody()->write(json_encode($res1));
    }

});


//    @FormUrlEncoded
//    @POST("profile/set/fullName")
//    Call < WebServiceMessage> setProfileFullName(@Field("token") String token, @Field("fullName") String fullName);
$app->post("/profile/set/fullName", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone', 'fullName'))) {

        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        $fullName = $requestData['fullName'];

        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfileFullName($phone, $fullName);
        $mds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));
    }

});

//    @FormUrlEncoded
//    @POST("profile/set/location")
//    Call < WebServiceMessage> setProfileLocation(@Field("token") String token, @Field("location") String location);

$app->post("/profile/set/location", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'location'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $location = $requestData['location'];

        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfileLocation($token, $location);
        $mds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));

    }

});

//    @FormUrlEncoded
//    @POST("profile/set/photo")
//    Call < WebServiceMessage> setProfilePhoto(@Field("token") String token, @Field("photo") String photo);
$app->post("/profile/set/photo", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];


        $directory = $this->get('upload_directory');
        $uploadedFiles = $request->getUploadedFiles();
        $uploadedFile = $uploadedFiles['file'];
        $filename = "";
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $filename = moveUploadedFile($directory, $uploadedFile);
        }


        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfilePhoto($token, $filename);
        $mds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));

    }

});


//    @FormUrlEncoded
//    @POST("password/forgot/enterPhoneNumber")
//    Call < WebServiceMessage> enterPhoneNumberToRecoverPassword(@Field("phone") String phone);
$app->post("/password/forgot/enterPhoneNumber", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone'))) {

        $requestData = $request->getParsedBody();
        $ver = rand(10000, 99999);
        $phone = $requestData['phone'];
        $member = new Member();
        $member->setPhone($phone);
        $member->setVerificationCode($ver);
        $mds = new MemberDataSource();
        $mds->open();
        $id = $mds->enterPhoneNumber($member);
        $mds->close();

        if ($id > 0) {
            $sms = new SmsSender();
            $res = $sms->enqueueSample($phone, "your Verification Code is $ver");
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = $res;
            //echo json_encode($response);
            $response->getBody()->write(json_encode($res1));
        } else {
            $res1 = array();
            $res1["error"] = true;
            $res1["message"] = "error";
            $response->getBody()->write(json_encode($res1));
        }
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));


    }

});

//    @FormUrlEncoded
//    @POST("password/forgot/enterEmail")
//    Call < WebServiceMessage> enterEmailToRecoverPassword(@Field("email") String email);
$app->post("/password/forgot/enterEmail", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('email'))) {


        $requestData = $request->getParsedBody();
        $ver = rand(10000, 99999);
        $phone = $requestData['email'];
        $member = new Member();
        $member->setPhone($phone);
        $member->setVerificationCode($ver);
        $mds = new MemberDataSource();
        $mds->open();
        $id = $mds->enterPhoneNumber($member);
        $mds->close();

        if ($id > 0) {
            $sms = new SmsSender();
            $res = $sms->enqueueSample($phone, "your Verification Code is $ver");
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = $res;
            //echo json_encode($response);
            $response->getBody()->write(json_encode($res1));
        } else {
            $res1 = array();
            $res1["error"] = true;
            $res1["message"] = "error";
            $response->getBody()->write(json_encode($res1));
        }
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));
    }

});

//    @FormUrlEncoded
//    @POST("password/get")
//    Call<WebServiceMessage> getPassword(@Field("token") String token, @Field("password") String password);
$app->post("/password/check", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'password'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $password = $requestData['password'];

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setMemberId(1);
        $member->setPassword($password);

        $res = $mds->checkPassword($member);
        $mds->close();

        $res1 = array();

        if ($res == true) {
            $res1["error"] = false;
            $res1["message"] = "successful";

        } else {
            $res1["error"] = true;
            $res1["message"] = "failed";

        }
        //echo json_encode($response);
        $response->getBody()->write(json_encode($res1));
    }

});


//    @FormUrlEncoded
//    @POST("password/change")
//    Call<WebServiceMessage> changePassword(@Field("token") String token, @Field("old") String oldPassword, @Field("new") String newPassword);
$app->post("/password/change", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'old', 'new'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $old = $requestData['old'];
        $new = $requestData['new'];

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setMemberId(1);
        $member->setPassword($new);

        $res = $mds->changePassword($member);
        $mds->close();

        $res1 = array();

        $res1["error"] = false;
        $res1["message"] = "successful";

        //echo json_encode($response);
        $response->getBody()->write(json_encode($res1));

    }

});

//    @FormUrlEncoded
//    @POST("login")
//    Call < WebServiceMessage> login(@Field("phone") String phoneNumber, @Field("password") String password);
$app->post("/login", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone', 'password'))) {
        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        $password = $requestData['password'];
//        echo $phone;
//        echo "<br>";
//        echo $password;
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setPhone($phone);
        $member->setPassword($password);
        $res = $mds->login($member);
        $mds->close();

        $token = "";
        $res1 = array();
        if ($res > 0) {
            $token = bin2hex(random_bytes(64));
            $login = new Login();
            $login->setDescription("$res  logged in");
            $login->setIP($_SERVER["REMOTE_ADDR"]);
            $login->setToken($token);
            $login->setMemberId($res);
            $lds = new LoginDataSource();
            $lds->open();
            $lds->createLog($login);
            $lds->close();

            $res1["error"] = false;
            $res1["message"] = $token;
        } else {
            $token = "error";
            $res1["error"] = true;
            $res1["message"] = $token;
        }
        //echo json_encode($response);
        $response->getBody()->write(json_encode($res1));


    }

});

//    @FormUrlEncoded
//    @POST("password/create")
//    Call < WebServiceMessage> createPassword(@Field("password") String password);

$app->post("/password/create", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('password'))) {


        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        $password = $requestData['password'];
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setPassword($password);
        $res = $mds->createPassword($member);
        $mds->close();

        $res1 = array();

        if ($res == true) {
            $res1["error"] = false;
            $res1["message"] = "successful";

        } else {
            $res1["error"] = true;
            $res1["message"] = "failed";
        }

        $response->getBody()->write(json_encode($res1));
    }


});

//    @FormUrlEncoded
//    @POST("post/create/audio")
//    Call < WebServiceMessage> createAudioPost(@Field("token") String token);

$app->post("/post/create/audio", function (Request $request, Response $response) {

    require_once '../classes/datasource/PostDataSource.inc';

    if (isTheseParametersAvailable(array('token'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];


        $directory = $this->get('upload_directory');
        $uploadedFiles = $request->getUploadedFiles();
        $uploadedFile = $uploadedFiles['file'];
        $filename = "";
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $filename = moveUploadedFile($directory, $uploadedFile);
        }


        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $title = $requestData['title'];
        $description = $requestData['description'];
        $tags = $requestData['tags'];

        $post = new Post();
        $post->setTitle($title);
        $post->setDescription($description);
        $post->getMediaType()->setTitle("Audio");


        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();


        $pds = new PostDataSource();
        $pds->open();
        $pds->create($post, $memberId, $tags);
        $pds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));

    }

});

//    @FormUrlEncoded
//    @POST("post/create/photo")
//    Call < WebServiceMessage> createPhotoPost(@Field("token") String token);

$app->post("/post/create/image", function (Request $request, Response $response) {

    require_once '../classes/datasource/PostDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'title', 'description', 'tags'))) {

        $directory = $this->get('upload_directory');
        $uploadedFiles = $request->getUploadedFiles();
        //fgdg
        $uploadedFile = $uploadedFiles['file'];
        $filename = "";
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $filename = moveUploadedFile($directory, $uploadedFile);
        }

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $title = $requestData['title'];
        $description = $requestData['description'];
        $tags = $requestData['tags'];

        $post = new Post();
        $post->setTitle($title);
        $post->setDescription($description);
        $post->getMediaType()->setTitle("Image");


        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();


        $pds = new PostDataSource();
        $pds->open();
        $pds->create($post, $memberId, $tags);
        $pds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));


    }

});

//    @FormUrlEncoded
//    @POST("post/create/text")
//    Call < WebServiceMessage> createTextPost(@Field("token") String token);

$app->post("/post/create/text", function (Request $request, Response $response) {

    require_once '../classes/datasource/PostDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'title', 'description', 'tags'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $title = $requestData['title'];
        $description = $requestData['description'];
        $tags = $requestData['tags'];

        $post = new Post();
        $post->setTitle($title);
        $post->setDescription($description);
        $post->getMediaType()->setTitle("Text");


        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();


        $pds = new PostDataSource();
        $pds->open();
        $pds->create($post, $memberId, $tags);
        $pds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));

    }

});

//    @FormUrlEncoded
//    @POST("post/create/video")
//    Call < WebServiceMessage> createVideoPost(@Field("token") String token);

$app->post("/post/create/video", function (Request $request, Response $response) {

    require_once '../classes/datasource/PostDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'title', 'description', 'tags'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];


        $directory = $this->get('upload_directory');
        $uploadedFiles = $request->getUploadedFiles();
        $uploadedFile = $uploadedFiles['file'];
        $filename = "";
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $filename = moveUploadedFile($directory, $uploadedFile);
        }


        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $title = $requestData['title'];
        $description = $requestData['description'];
        $tags = $requestData['tags'];

        $post = new Post();
        $post->setTitle($title);
        $post->setDescription($description);
        $post->getMediaType()->setTitle("Video");


        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();


        $pds = new PostDataSource();
        $pds->open();
        $pds->create($post, $memberId, $tags);
        $pds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));


    }

});


//    @FormUrlEncoded
//    @POST("post/get")
//    Call < WebServiceMessage> getPostDetails(@Field("token") String token, @Field("postId") long postId);

$app->post("/post/get", function (Request $request, Response $response) {

    require_once '../classes/datasource/PostDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'postId'))) {

        $requestData = $request->getParsedBody();
        $postId = $requestData['postId'];
        $token = $requestData['token'];

        $pds = new PostDataSource();
        $pds->open();
        $post = new Post();
        $post = $pds->getPost($postId, true);
        $pds->close();

        $res1 = array();
        $res1["postId"] = $post->getPostId();
        $res1["createTime"] = $post->getCreateTime();
        $res1["editTime"] = $post->getEditTime();
        $res1["deleteTime"] = $post->getDeleteTime();

        $comments = array();

        foreach ($post->getComments() as $cmnt) {
            $comment = array();

            $comment["commentId"] = $cmnt->getCommentId();
            $comment["content"] = $cmnt->getContent();
            $comment["member"] = $cmnt->getMember();
            $comment["time"] = $cmnt->getTime();
            $comment["objectType"] = $cmnt->getObjectType();
            $comment["object"] = $cmnt->getObject();
            $comment["parent"] = $cmnt->getParent();
            $comment["situation"] = $cmnt->getSituation();

            array_push($comments, $comment);
        }
        $res1["comments"] = json_encode(array($comments));

        $response->getBody()->write(json_encode($res1));
    }

});

//    @FormUrlEncoded
//    @POST("post/like")
//    Call < WebServiceMessage> like(@Field("token") String token,@Field("postId") long postId);

$app->post("/post/like", function (Request $request, Response $response) {


    require_once '../classes/datasource/LikeDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'postId'))) {
        $requestData = $request->getParsedBody();
        $postId = $requestData['postId'];
        $token = $requestData['token'];

        $lds = new LikeDataSource();
        $lds->open();
        $lds->like($postId, $token);
        $lds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));
    }

});


//    @FormUrlEncoded
//    @POST("post/search")
//    Call < WebServiceMessage> search(@Field("token") String token,@Field("text") String text);

$app->post("/post/search", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'text'))) {
        $requestData = $request->getParsedBody();
        $text = $requestData['text'];
        $token = $requestData['token'];
        $psts = array();
        $pds = new PostDataSource();
        $pds->open();
        $psts = $pds->search($text);
        $posts = array();
        foreach ($psts as $pst) {
            $post = array();
            $post["postId"] = $pst->getPostId();
            $post["title"] = $pst->getTitle();
            $post["description"] = $pst->getDescription();
            $post["description"] = $pst->getDescription();
            $post["deleteTime"] = $post->getDeleteTime();
            $post["createTime"] = $post->getCreateTime();
            $post["editTime"] = $post->getEditTime();
            array_push($posts, $post);
        }
        $response->getBody()->write(json_encode(array("posts" => $posts)));
    }

});


//    @FormUrlEncoded
//    @POST("posts/viral")
//    Call < WebServiceMessage> getViral(@Field("token") String token);

$app->post("/posts/viral", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $psts = array();
        $pds = new PostDataSource();
        $pds->open();
        $psts = $pds->getViral();
        $posts = array();
        foreach ($psts as $pst) {
            $post = array();
            $post["postId"] = $pst->getPostId();
            $post["title"] = $pst->getTitle();
            $post["description"] = $pst->getDescription();
            $post["description"] = $pst->getDescription();
            $post["deleteTime"] = $post->getDeleteTime();
            $post["createTime"] = $post->getCreateTime();
            $post["editTime"] = $post->getEditTime();
            array_push($posts, $post);
        }
        $response->getBody()->write(json_encode(array("posts" => $posts)));
    }

});

//    @FormUrlEncoded
//    @POST("post/share")
//    Call<WebServiceMessage> share(@Field("token") String token, @Field("receiver") long receiver, @Field("post") long post);

$app->post("/post/share", function (Request $request, Response $response) {

    require_once '../classes/datasource/ShareDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'post', 'receiver'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $post = $requestData['post'];
        $receiver = $requestData['receiver'];


        $sds = new ShareDataSource();
        $sds->open();
        $res = $sds->share($token, $receiver, $post);
        $sds->close();

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $response->getBody()->write(json_encode($res1));
    }

});

//    @FormUrlEncoded
//    @POST("member/get")
//    Call < WebServiceMessage> getMemberDetails(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/member/get", function (Request $request, Response $response) {

    require_once '../classes/datasource/LoginDataSource.inc';
    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/MemberDataSource.inc';
    require_once '../classes/datasource/PostDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'memberId'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $memberId = $requestData['memberId'];


        if ($memberId == 0) {
            $lds = new LoginDataSource();
            $lds->open();
            $memberId = $lds->getMemberIdBasedOnToken($token);
            $lds->close();
        }

        $mds = new MemberDataSource();
        $mds->open();
        $member = $mds->getMember($memberId);
        $mds->close();


        $fds = new FollowDataSource();
        $fds->open();

        $fllwngs = $fds->getFollowings($memberId);
        $followings = array();
        foreach ($fllwngs as $fllwng) {
            $following = array();
            $following["followId"] = $fllwng->getFollowId();
            $following["situation"] = $fllwng->getSituation();
            $following["time"] = $fllwng->getTime();

            $mem = array();
            $mem['memberId'] = $fllwng->getMember()->getMemberId();
            $mem['fullName'] = $fllwng->getMember()->getFullName();
            $mem['email'] = $fllwng->getMember()->getEmail();
            $mem['phone'] = $fllwng->getMember()->getPhone();
            $following["member"] = $mem;
            array_push($followings, $following);
        }

        $fllwrs = $fds->getFollowers($memberId);
        $followers = array();
        foreach ($fllwrs as $fllwr) {
            $follower = array();
            $follower["followId"] = $fllwr->getFollowId();
            $follower["situation"] = $fllwr->getSituation();
            $follower["time"] = $fllwr->getTime();

            $mem = array();
            $mem['memberId'] = $fllwr->getMember()->getMemberId();
            $mem['fullName'] = $fllwr->getMember()->getFullName();
            $mem['email'] = $fllwr->getMember()->getEmail();
            $mem['phone'] = $fllwr->getMember()->getPhone();
            $follower["member"] = $mem;

            array_push($followers, $follower);
        }

        $fds->close();


        $pds = new PostDataSource();
        $pds->open();

        $psts = $pds->getMemberPosts($memberId);

        $posts = array();
        foreach ($psts as $pst) {
            $post = array();
            $post["postId"] = $pst->getPostId();
            $post["title"] = $pst->getTitle();
            $post["description"] = $pst->getDescription();
            $post["description"] = $pst->getDescription();
            $post["deleteTime"] = $pst->getDeleteTime();
            $post["createTime"] = $pst->getCreateTime();
            $post["editTime"] = $pst->getEditTime();
            array_push($posts, $post);
        }

        $pds->close();

        $res3 = array();
        $res3["memberId"] = $member->getMemberId();
        $res3["fullName"] = $member->getFullName();
        $res3["email"] = $member->getEmail();
        $res3["phone"] = $member->getPhone();
        $res3['followers'] = $followers;
        $res3['followings'] = $followings;
        $res3['posts'] = $posts;

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $res2 = array();
        $res2["message"] = $res1;
        $res2['member'] = $res3;

//
        $response->getBody()->write(json_encode($res2));


//        $response->getBody()->write(json_encode($res1));
    }

});


//    @FormUrlEncoded
//    @POST("logs/get/all")
//    Call < WebServiceMessage> getEventLogs(@Field("token") String token);

$app->post("/logs/get/all", function (Request $request, Response $response) {

    require_once '../classes/datasource/LogDataSource.inc';
    if (isTheseParametersAvailable(array('token'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];

        $lds = new LogDataSource();
        $lds->open();
        $lgs = $lds->getLogs($token);
        $lds->close();

        $logs = array();
        foreach ($lgs as $lg) {
            $log = array();
            $log["logId"] = $lg->getLogId();
            $log["description"] = $lg->getDescription();
            array_push($logs, $log);
        }
        $response->getBody()->write(json_encode(array("logs" => $logs)));
    }

});

//    @FormUrlEncoded
//    @POST("followers/get/requests")
//    Call < WebServiceMessage> getFollowRequests(@Field("token") String token);

$app->post("/followers/get/requests", function (Request $request, Response $response) {

    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';

    if (isTheseParametersAvailable(array('token'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $fds = new FollowDataSource();
        $fds->open();
        $rqusts = $fds->getFollowersRequests($memberId);
        $fds->close();

        $requests = array();
        foreach ($rqusts as $rqust) {
            $request = array();
            $request["followId"] = $rqust->getFollowId();
            $request["member"] = $rqust->getMember();
            $request["object"] = $rqust->getObject();
            $request["objectType"] = $rqust->getObjectType();
            $request["situation"] = $rqust->getSituation();
            $request["time"] = $rqust->getTime();
            array_push($requests, $request);
        }
        $response->getBody()->write(json_encode(array("requests" => $requests)));
    }

});

//    @FormUrlEncoded
//    @POST("followers/confirm")
//    Call < WebServiceMessage> getConfirmRequest(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/followers/confirm", function (Request $request, Response $response) {
    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'memberId'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $memberId = $requestData['token'];
        $lds = new LoginDataSource();
        $lds->open();
        $object = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $fds = new FollowDataSource();
        $fds->open();
        $res = $fds->confirmRequest($object, $memberId);
        $fds->close();

        if ($res == true) {
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = "successful";
            $response->getBody()->write(json_encode($res1));
        }
    }

});

//    @FormUrlEncoded
//    @POST("followers/reject")
//    Call < WebServiceMessage> getRejectRequest(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/followers/reject", function (Request $request, Response $response) {
    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';

    if (isTheseParametersAvailable(array('token', 'memberId'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $memberId = $requestData['token'];
        $lds = new LoginDataSource();
        $lds->open();
        $object = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $fds = new FollowDataSource();
        $fds->open();
        $res = $fds->rejectRequest($object, $memberId);
        $fds->close();

        if ($res == true) {
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = "successful";
            $response->getBody()->write(json_encode($res1));
        }

    }

});

//    @FormUrlEncoded
//    @POST("followers/get/list")
//    Call < WebServiceMessage> getFollowersList(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/followers/get/list", function (Request $request, Response $response) {

    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'memberId'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $memberId = $requestData['memberId'];
        if ($memberId == 0) {
            $lds = new LoginDataSource();
            $lds->open();
            $memberId = $lds->getMemberIdBasedOnToken($token);
            $lds->close();
        }
        //echo  $memberId . "<br>";

        $fds = new FollowDataSource();
        $fds->open();
        $rqusts = $fds->getFollowers($memberId);
        $fds->close();

        $reqs = array();
        foreach ($rqusts as $rqust) {
            $req = array();
            $req["followId"] = $rqust->getFollowId();
            $mem = array();
            $mem['memberId'] = $rqust->getMember()->getMemberId();
            $mem['fullName'] = $rqust->getMember()->getFullName();
            $mem['email'] = $rqust->getMember()->getEmail();
            $mem['phone'] = $rqust->getMember()->getPhone();

            $req["member"] = $mem;
            $req["situation"] = $rqust->getSituation();
            $req["time"] = $rqust->getTime();
            array_push($reqs, $req);
        }

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $res2 = array();
        $res2['message'] = $res1;
        $res2['follows'] = $reqs;

        $response->getBody()->write(json_encode($res2));
    }

});


//    @FormUrlEncoded
//    @POST("followings/get/list")
//    Call < WebServiceMessage> getFollowingsList(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/followings/get/list", function (Request $request, Response $response) {

    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'memberId'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $memberId = $requestData['memberId'];
        if ($memberId == 0) {
            $lds = new LoginDataSource();
            $lds->open();
            $memberId = $lds->getMemberIdBasedOnToken($token);
            $lds->close();
        }

        $fds = new FollowDataSource();
        $fds->open();
        $rqusts = $fds->getFollowings($memberId);
        $fds->close();

        $reqs = array();
        foreach ($rqusts as $rqust) {
            $req = array();
            $req["followId"] = $rqust->getFollowId();
            $mem = array();
            $mem['memberId'] = $rqust->getMember()->getMemberId();
            $mem['fullName'] = $rqust->getMember()->getFullName();
            $mem['email'] = $rqust->getMember()->getEmail();
            $mem['phone'] = $rqust->getMember()->getPhone();

            $req["member"] = $mem;
            $req["situation"] = $rqust->getSituation();
            $req["time"] = $rqust->getTime();
            array_push($reqs, $req);
        }

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $res2 = array();
        $res2['message'] = $res1;
        $res2['follows'] = $reqs;

        $response->getBody()->write(json_encode($res2));
    }

});

//    @FormUrlEncoded
//    @POST("followings/unfollow")
//    Call < WebServiceMessage> unFollow(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/followings/unfollow", function (Request $request, Response $response) {

    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'memberId'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $object = $requestData['memberId'];
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $fds = new FollowDataSource();
        $fds->open();
        $res = $fds->follow($object, $memberId);
        $fds->close();
        if ($res == true) {
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = "successful";
            $response->getBody()->write(json_encode($res1));
        }

    }

});

//    @FormUrlEncoded
//    @POST("followings/follow")
//    Call<WebServiceMessage> follow(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/followings/follow", function (Request $request, Response $response) {

    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'memberId'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $object = $requestData['memberId'];
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $fds = new FollowDataSource();
        $fds->open();
        $res = $fds->follow($object, $memberId);
        $fds->close();
        if ($res == true) {
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = "successful";
            $response->getBody()->write(json_encode($res1));
        }

    }

});


//    @FormUrlEncoded
//    @POST("followings/send/request")
//    Call < WebServiceMessage> requestFollow(@Field("token") String token, @Field("memberId") long memberId);


$app->post("/followings/send/request", function (Request $request, Response $response) {

    require_once '../classes/datasource/FollowDataSource.inc';
    require_once '../classes/datasource/LoginDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'memberId'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $object = $requestData['memberId'];
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $fds = new FollowDataSource();
        $fds->open();
        $res = $fds->follow($object, $memberId);
        $fds->close();
        if ($res == true) {
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = "successful";
            $response->getBody()->write(json_encode($res1));
        }

    }


});


//    @FormUrlEncoded
//    @POST("comment/send/file")
//    Call < WebServiceMessage> sendFileComment(@Field("token") String token, @Field("file") String file);

$app->post("/comment/send/file", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'file'))) {


    }

});

//    @FormUrlEncoded
//    @POST("comment/send/text")
//    Call<WebServiceMessage> comment(@Field("token") String token, @Field("content") String content, @Field("parent") long parent, @Field("object") long object);

$app->post("/comment/send/text", function (Request $request, Response $response) {

    require_once '../classes/datasource/CommentDataSource.inc';
    if (isTheseParametersAvailable(array('token', 'content', 'memberId', 'parent'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $parent = $requestData['parent'];
        $object = $requestData['object'];
        $content = $requestData['content'];
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $comment = new Comment();
        $comment->setContent($content);
        $comment->setObjectType("Post");
        $comment->setObject($object);
        $comment->setParent($parent);

        $cds = new CommentDataSource();
        $cds->open();
        $res = $cds->comment($comment);
        $cds->close();

        if ($res == true) {
            $res1 = array();
            $res1["error"] = false;
            $res1["message"] = "successful";
            $response->getBody()->write(json_encode($res1));

        }
    }

});

//    @FormUrlEncoded
//    @POST("comment/reply/file")
//    Call < WebServiceMessage> replyFileComment(@Field("token") String token, @Field("file") String file, @Field("commentId") long commentId);

$app->post("/comment/reply/file", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'file', 'commentId'))) {

    }

});

//    @FormUrlEncoded
//    @POST("comment/reply/text")
//    Call < WebServiceMessage> replyTextComment(@Field("token") String token, @Field("text") String text, @Field("commentId") long commentId);

$app->post("/comment/reply/text", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'text', 'commentId'))) {

    }

});


//    @FormUrlEncoded
//    @POST("members/suggestion")
//    Call < WebServiceMessage> getSuggestions(@Field("token") String token);

$app->post("/members/suggestion", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $mds = new MemberDataSource();
        $mds->open();
        $mmbrs = $mds->suggest();
        $mds->close();
        $members = array();
        foreach ($mmbrs as $mmbr) {
            $member = array();
            $member["memberId"] = $mmbr->getMemberId();
            $member["fullName"] = $mmbr->getFullName();
            $member["phone"] = $mmbr->getPhone();
            $member["email"] = $mmbr->getEmail();
            array_push($members, $member);
        }
        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $res2 = array();
        $res2['message'] = $res1;
        $res2['members'] = $members;
        $response->getBody()->write(json_encode($res2));

        //$response->getBody()->write(json_encode(array("members" => $members)));
    }

});


//    @FormUrlEncoded
//    @POST("friends/search")
//    Call < WebServiceMessage> searchFriends(@Field("token") String token);

$app->post("/friends/search", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'text'))) {
        $requestData = $request->getParsedBody();
        $text = $requestData['text'];
        $token = $requestData['token'];
        $psts = array();
        $pds = new MemberDataSource();
        $pds->open();
        $psts = $pds->search($text);
        $members = array();
        foreach ($psts as $pst) {
            $member = array();
            $member["memberId"] = $pst->getMemberId();
            $member["fullName"] = $pst->getFullName();
            $member["email"] = $pst->getemail();
            $member["phone"] = $pst->getPhone();
            array_push($members, $member);
        }

        $res1 = array();
        $res1["error"] = false;
        $res1["message"] = "successful";
        $res2 = array();
        $res2['message'] = $res1;
        $res2['members'] = $members;
        $response->getBody()->write(json_encode($res2));


//        $response->getBody()->write(json_encode(array("members" => $members)));
    }

});


$app->run();