<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


require '../vendor/autoload.php';
require_once '../classes/datasource/MemberDataSource.inc';
require_once '../classes/datasource/LoginDataSource.inc';

$app = new \Slim\App([
    'settings' => [
        'displayErrorDetails' => true
    ]
]);

$container = $app->getContainer();
$container['upload_directory'] = __DIR__ . '/uploads';

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
    $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
    $filename = sprintf('%s.%0.8s', $basename, $extension);

    $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

    return $filename;
}


$app->post("/upload", function (Request $request,Response $response){

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
//    @POST("register/enterPhoneNumber")
//    Call < WebServiceMessage> enterPhoneNumber(@Field("phone") String phone);
$app->post("/register/enterPhoneNumber", function (Request $request, Response $response) {

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
            $response = array();
            $response["error"] = false;
            $response["message"] = $res;
            //echo json_encode($response);
            $response->getBody()->write(json_encode($response));
        } else {
            $response = array();
            $response["error"] = true;
            $response["message"] = "error";
            $response->getBody()->write(json_encode($response));
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


        $response = array();

        if ($res == true) {
            $response["error"] = false;
            $response["message"] = "successful";
        } else {
            $response["error"] = true;
            $response["message"] = "failed";

        }
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));
    }

});


//    @FormUrlEncoded
//    @POST("register/createPassword")
//    Call < WebServiceMessage> createPassword(@Field("token") String token, @Field("password") String password);

$app->post("/register/createPassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'password'))) {
        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $password = $requestData['password'];

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setMemberId(1);
        $member->setPassword($password);

        $mds->createPassword($member);
        $mds->close();

        $response = array();

        $response["error"] = false;
        $response["message"] = "successful";

        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));

    }

});


//    @FormUrlEncoded
//    @POST("profile/get")
//    Call < WebServiceMessage> getProfileDetail(@Field("token") String token);

$app->post("/profile/get", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $mds = new MemberDataSource();
        $mds->open();
        $member = new Member();
        $member = $mds->getProfileBasedOnToken($token);
        $mds->close();
        $response = array();
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

        $response['memberId'] = $member->getMemberId();
        $response['fullName'] = $member->getFullName();
        $response['phone'] = $member->getPhone();
        $response['Email'] = $member->getEmail();
        $response->getBody()->write(json_encode($response));
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

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));
    }

});

//    @FormUrlEncoded
//    @POST("profile/set/email")
//    Call < WebServiceMessage> setProfileEmail(@Field("token") String token, @Field("email") String email);
$app->post("/profile/set/email", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'email'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $email = $requestData['email'];

        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfileEmail($token, $email);
        $mds->close();

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));

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

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));
    }

});


//    @FormUrlEncoded
//    @POST("profile/set/fullName")
//    Call < WebServiceMessage> setProfileFullName(@Field("token") String token, @Field("fullName") String fullName);
$app->post("/profile/set/fullName", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'fullName'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $fullName = $requestData['fullName'];

        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfileFullName($token, $fullName);
        $mds->close();

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));

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

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));

    }

});

//    @FormUrlEncoded
//    @POST("profile/set/photo")
//    Call < WebServiceMessage> setProfilePhoto(@Field("token") String token, @Field("photo") String photo);
$app->post("/profile/set/photo", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'photo'))) {

        $requestData = $request->getParsedBody();
        $token = $requestData['token'];
        $photo = $requestData['photo'];

        $mds = new MemberDataSource();
        $mds->open();
        $mds->updateProfilePhoto($token, $photo);
        $mds->close();

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));

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
            $response = array();
            $response["error"] = false;
            $response["message"] = $res;
            //echo json_encode($response);
            $response->getBody()->write(json_encode($response));
        } else {
            $response = array();
            $response["error"] = true;
            $response["message"] = "error";
            $response->getBody()->write(json_encode($response));
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
            $response = array();
            $response["error"] = false;
            $response["message"] = $res;
            //echo json_encode($response);
            $response->getBody()->write(json_encode($response));
        } else {
            $response = array();
            $response["error"] = true;
            $response["message"] = "error";
            $response->getBody()->write(json_encode($response));
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

        $response = array();

        if ($res == true) {
            $response["error"] = false;
            $response["message"] = "successful";

        } else {
            $response["error"] = true;
            $response["message"] = "failed";

        }
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));
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

        $response = array();

        $response["error"] = false;
        $response["message"] = "successful";

        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));

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
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7

        $mds = new MemberDataSource();
        $mds->open();

        $member = new Member();
        $member->setPhone($phone);
        $member->setPassword($password);
        $res = $mds->login($member);
        $mds->close();

        $token = "";
        if ($res == true) {
            $token = bin2hex(random_bytes(64));
        } else {
            $token = "error";
        }

        $response = array();
        $response["error"] = false;
        $response["message"] = $token;
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));


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

        $response = array();

        if ($res == true) {
            $response["error"] = false;
            $response["message"] = "successful";

        } else {
            $response["error"] = true;
            $response["message"] = "failed";
        }

        $response->getBody()->write(json_encode($response));
    }


});

//    @FormUrlEncoded
//    @POST("post/create/audio")
//    Call < WebServiceMessage> createAudioPost(@Field("token") String token);

$app->post("/post/create/audio", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

    }

});

//    @FormUrlEncoded
//    @POST("post/create/photo")
//    Call < WebServiceMessage> createPhotoPost(@Field("token") String token);

$app->post("/post/create/photo", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

    }

});

//    @FormUrlEncoded
//    @POST("post/create/text")
//    Call < WebServiceMessage> createTextPost(@Field("token") String token);

$app->post("/post/create/text", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

    }

});

//    @FormUrlEncoded
//    @POST("post/create/video")
//    Call < WebServiceMessage> createVideoPost(@Field("token") String token);

$app->post("/post/create/video", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

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
        $post = $pds->getPost($postId);
        $pds->close();

        $response = array();
        $response["postId"] = $post->getPostId();
        $response["createTime"] = $post->getCreateTime();
        $response["editTime"] = $post->getEditTime();
        $response["deleteTime"] = $post->getDeleteTime();

        $response->getBody()->write(json_encode($response));
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

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));
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

        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        $response->getBody()->write(json_encode($response));
    }

});

//    @FormUrlEncoded
//    @POST("member/get")
//    Call < WebServiceMessage> getMemberDetails(@Field("token") String token, @Field("memberId") long memberId);

$app->post("/member/get", function (Request $request, Response $response) {

    require_once '../classes/datasource/LoginDataSource.inc';
    require_once '../classes/datasource/MemberDataSource.inc';
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

        $response = array();
        $response["memberId"] = $member->getMemberId();
        $response["fullName"] = $member->getFullName();
        $response["email"] = $member->getEmail();
        $response->getBody()->write(json_encode($response));
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
        $response->getBody()->write(json_encode(array("members" => $members)));
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
            $response = array();
            $response["error"] = false;
            $response["message"] = "successful";
            $response->getBody()->write(json_encode($response));
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
            $response = array();
            $response["error"] = false;
            $response["message"] = "successful";
            $response->getBody()->write(json_encode($response));
        }

    }

});

//    @FormUrlEncoded
//    @POST("followers/get/list")
//    Call < WebServiceMessage> getFollowersList(@Field("token") String token);

$app->post("/followers/get/list", function (Request $request, Response $response) {

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
        $rqusts = $fds->getFollowers($memberId);
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
//    @POST("followings/get/list")
//    Call < WebServiceMessage> getFollowingsList(@Field("token") String token);

$app->post("/followings/get/list", function (Request $request, Response $response) {

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
        $rqusts = $fds->getFollowings($memberId);
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
            $response = array();
            $response["error"] = false;
            $response["message"] = "successful";
            $response->getBody()->write(json_encode($response));
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
            $response = array();
            $response["error"] = false;
            $response["message"] = "successful";
            $response->getBody()->write(json_encode($response));
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
            $response = array();
            $response["error"] = false;
            $response["message"] = "successful";
            $response->getBody()->write(json_encode($response));
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
            $response = array();
            $response["error"] = false;
            $response["message"] = "successful";
            $response->getBody()->write(json_encode($response));

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
        $response->getBody()->write(json_encode(array("members" => $members)));
    }

});


$app->run();