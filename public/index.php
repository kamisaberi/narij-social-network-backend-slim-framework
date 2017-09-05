<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


require '../vendor/autoload.php';
require_once '../classes/datasource/MemberDataSource.inc';


$app = new \Slim\App([
    'settings' => [
        'displayErrorDetails' => true
    ]
]);


//    @FormUrlEncoded
//    @POST("register/enterPhoneNumber")
//    Call < WebServiceMessage> enterPhoneNumber(@Field("phone") String phone);
$app->post("/register/enterPhoneNumber", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone'))) {

    }

});

//    @FormUrlEncoded
//    @POST("register/confirmVerificationCode")
//    Call < WebServiceMessage> confirmPhoneNumber(@Field("token") String token, @Field("verificationCode") String verificationCode);
$app->post("/register/confirmVerificationCode", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token','verificationCode'))) {

    }

});



//    @FormUrlEncoded
//    @POST("register/createPassword")
//    Call < WebServiceMessage> createPassword(@Field("token") String token, @Field("password") String password);

    $app->post("/register/createPassword", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','password'))) {

        }

    });


//    @FormUrlEncoded
//    @POST("profile/get")
//    Call < WebServiceMessage> getProfileDetail(@Field("token") String token);

    $app->post("/profile/get", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("profile/set")
//    Call < WebServiceMessage> setProfileDetail(@Field("token") String token, @Field("fullName") String fullName, @Field("email") String email, @Field("location") String location, @Field("photo") String photo);

    $app->post("/profile/set", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','fullName','email','location','photo'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("profile/set/email")
//    Call < WebServiceMessage> setProfileEmail(@Field("token") String token, @Field("email") String email);
    $app->post("/profile/set/email", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','email'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("profile/set/fullName")
//    Call < WebServiceMessage> setProfileFullName(@Field("token") String token, @Field("fullName") String fullName);
    $app->post("/profile/set/fullName", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','fullName'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("profile/set/location")
//    Call < WebServiceMessage> setProfileLocation(@Field("token") String token, @Field("location") String location);

    $app->post("/profile/set/location", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','location'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("profile/set/photo")
//    Call < WebServiceMessage> setProfilePhoto(@Field("token") String token, @Field("photo") String photo);
    $app->post("/profile/set/photo", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','photo'))) {

        }

    });


//    @FormUrlEncoded
//    @POST("password/forgot/enterPhoneNumber")
//    Call < WebServiceMessage> enterPhoneNumberToRecoverPassword(@Field("phone") String phone);
    $app->post("/password/forgot/enterPhoneNumber", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('phone'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("password/forgot/enterEmail")
//    Call < WebServiceMessage> enterEmailToRecoverPassword(@Field("email") String email);
    $app->post("/password/forgot/enterEmail", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('email'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("password/change")
//    Call < WebServiceMessage> changePassword(@Field("old") String oldPassword, @Field("new") String newPassword);
    $app->post("/password/change", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('old','new'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("login")
//    Call < WebServiceMessage> login(@Field("phone") String phoneNumber, @Field("password") String password);
    $app->post("/login", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('phone','password'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("password/create")
//    Call < WebServiceMessage> createPassword(@Field("password") String password);

    $app->post("/password/create", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('password'))) {

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

        if (isTheseParametersAvailable(array('phone','postId'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("post/like")
//    Call < WebServiceMessage> like(@Field("token") String token,@Field("postId") long postId);

    $app->post("/post/like", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('phone','postId'))) {

        }

    });


//    @FormUrlEncoded
//    @POST("post/search")
//    Call < WebServiceMessage> search(@Field("token") String token);

    $app->post("/post/search", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

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
//    Call < WebServiceMessage> share(@Field("token") String token);

$app->post("/post/share", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

    }

});

//    @FormUrlEncoded
//    @POST("member/get")
//    Call < WebServiceMessage> getMemberDetails(@Field("token") String token, @Field("memberId") long memberId);

    $app->post("/member/get", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token', 'memberId'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("members/suggestion")
//    Call < WebServiceMessage> getSuggestions(@Field("token") String token);

    $app->post("/members/suggestion", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("logs/get/all")
//    Call < WebServiceMessage> getEventLogs(@Field("token") String token);

    $app->post("/logs/get/all", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("followers/get/requests")
//    Call < WebServiceMessage> getFollowRequests(@Field("token") String token);

    $app->post("/followers/get/requests", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("followers/confirm")
//    Call < WebServiceMessage> getConfirmRequest(@Field("token") String token, @Field("memberId") long memberId);

    $app->post("/followers/confirm", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','memberId'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("followers/reject")
//    Call < WebServiceMessage> getRejectRequest(@Field("token") String token, @Field("memberId") long memberId);

    $app->post("/followers/reject", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','memberId'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("followers/get/list")
//    Call < WebServiceMessage> getFollowersList(@Field("token") String token);

    $app->post("/followers/get/list", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });



//    @FormUrlEncoded
//    @POST("followings/get/list")
//    Call < WebServiceMessage> getFollowingsList(@Field("token") String token);

    $app->post("/followings/get/list", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("followings/unfollow")
//    Call < WebServiceMessage> unFollow(@Field("token") String token, @Field("memberId") long memberId);

    $app->post("/followings/unfollow", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token', 'memberId'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("followings/send/request")
//    Call < WebServiceMessage> requestFollow(@Field("token") String token, @Field("memberId") long memberId);


    $app->post("/followings/send/request", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','memberId'))) {

        }

    });


//    @FormUrlEncoded
//    @POST("comment/send/file")
//    Call < WebServiceMessage> sendFileComment(@Field("token") String token, @Field("file") String file);

    $app->post("/comment/send/file", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','file'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("comment/send/text")
//    Call < WebServiceMessage> sendTextComment(@Field("token") String token, @Field("text") String text);

    $app->post("/comment/send/text", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','text'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("comment/reply/file")
//    Call < WebServiceMessage> replyFileComment(@Field("token") String token, @Field("file") String file, @Field("commentId") long commentId);

    $app->post("/comment/reply/file", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','file','commentId'))) {

        }

    });

//    @FormUrlEncoded
//    @POST("comment/reply/text")
//    Call < WebServiceMessage> replyTextComment(@Field("token") String token, @Field("text") String text, @Field("commentId") long commentId);

    $app->post("/comment/reply/text", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token','text','commentId'))) {

        }

    });


//    @FormUrlEncoded
//    @POST("friends/search")
//    Call < WebServiceMessage> searchFriends(@Field("token") String token);

    $app->post("/friends/search", function (Request $request, Response $response) {

        if (isTheseParametersAvailable(array('token'))) {

        }

    });

////activity_login_signup
//$app->post("/register", function (Request $request, Response $response) {
//
//    if (isTheseParametersAvailable(array('name', 'email', 'password', 'gender'))) {
//        $requestData = $request->getParsedBody();
//        $name = $requestData['name'];
//        $email = $requestData['email'];
//        $password = $requestData['password'];
//        $gender = $requestData['gender'];
//        //$db = new DbOperation();
//        $responseData = array();
////        $result = $db->registerUser($name, $email, $password, $gender);
////
////        if ($result == USER_CREATED) {
////            $responseData['error'] = false;
////            $responseData['message'] = 'Registered successfully';
////            $responseData['user'] = $db->getUserByEmail($email);
////        } elseif ($result == USER_CREATION_FAILED) {
////            $responseData['error'] = true;
////            $responseData['message'] = 'Some error occurred';
////        } elseif ($result == USER_EXIST) {
////            $responseData['error'] = true;
////            $responseData['message'] = 'This email already exist, please login';
////        }
//
//        $response->getBody()->write(json_encode($responseData));
//    }
//
//
//});

//activity_login_signup
$app->post("/Register/EnterPhoneNumber", function (Request $request, Response $response) {

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

//activity_login_signup
$app->post("/register/confirmverificationcode", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'verificationCode'))) {
        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        //$token = bin2hex(random_bytes(64));


        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));
    }
});

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


$app->run();