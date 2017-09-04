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

//activity_create_password
$app->post("/register/createpassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'password'))) {


    }
});


//activity_create_password
$app->post("/profile/change", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'fullname', 'email', 'location', 'photo'))) {


    }

});


//activity_create_password
$app->post("/profile/changefullname", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'fullname', 'email', 'location', 'photo'))) {


    }

//    Call<WebServiceMessage> changeFullName(@Field("token") String token, @Field("fullname") String fullname);

});


//activity_create_password
$app->post("/profile/changeemail", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'email'))) {


    }

//    Call<WebServiceMessage> changeEmail(@Field("token") String token, @Field("email") String email);

});


//activity_create_password
$app->post("/profile/changephoto", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'photo'))) {


    }

//    Call<WebServiceMessage> changePhoto(@Field("token") String token, @Field("photo") String photo);

});


//activity_create_password
$app->post("/profile/changelocation", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'location'))) {


    }

//    Call<WebServiceMessage> changeLocation(@Field("token") String token, @Field("location") String location);

});


//activity_login_signup
$app->post("/login", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('username', 'email'))) {


    }
});


//activity_login_signup
$app->post("/profile/enterphonenumberforgotpassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone'))) {


    }
    //    Call<WebServiceMessage> enterPhoneNumberForgotpassword(@Field("phone") String phone);

});


//activity_login_signup
$app->post("/profile/enteremailforgotpassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('email'))) {


    }
    //    Call<WebServiceMessage> enterEmailForgotpassword(@Field("email") String email);

});


//activity_enter_email_address_forgot_password
$app->post("/forgotpassword/enteremail", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('username', 'email'))) {

    }

});

//activity_enter_phone_number_forgot_password
$app->post("/forgotpassword/enterphonenumber", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('username', 'email'))) {

    }

});

//activity_change_password
$app->post("/changepassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'password'))) {

    }


});


//activity_confirm_phone_number
$app->post("/confirmphonenumber", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone'))) {

    }


});


//activity_create_password
$app->post("createpassword", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array( 'password'))) {

    }

});


//activity_add_audio_document
$app->post("/documents/create/audio", function (Request $request, Response $response) {



});


//activity_add_photo_document
$app->post("/documents/create/photo", function (Request $request, Response $response) {


});


//activity_add_text_document
$app->post("/documents/create/text", function (Request $request, Response $response) {


});


//activity_add_video_document
$app->post("/documents/create/video", function (Request $request, Response $response) {


});


//activity_profile_email
//activity_profile_full_name
//activity_profile_location
//activity_profile_photo
$app->post("/profile/get", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token'))) {

    }

});

$app->post("/profile/set", function (Request $request, Response $response) {


});

$app->post("/profile/set/email", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'email'))) {

    }

});

$app->post("/profile/set/fullname", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'fullname'))) {

    }

});

$app->post("/profile/set/location", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'location'))) {

    }

});

$app->post("/profile/set/photo", function (Request $request, Response $response) {
    if (isTheseParametersAvailable(array('token', 'photo'))) {

    }

});


/////*visit Other page Sequence*/////
// func : get member profile data
$app->post("", function (Request $request, Response $response) {

});

/////*Answer a friend request*/////
// func : Get Event Logs
$app->post("", function (Request $request, Response $response) {

});


// func : Get Follow Request
$app->post("", function (Request $request, Response $response) {

});

// func : Confirm Request
$app->post("", function (Request $request, Response $response) {

});

// func : Reject Request
$app->post("", function (Request $request, Response $response) {

});


/////*Comment*/////
// func : Get Post Details
$app->post("", function (Request $request, Response $response) {

});

// func : Send File As Comment
$app->post("", function (Request $request, Response $response) {

});

// func : Send Text as Comment
$app->post("", function (Request $request, Response $response) {

});

// func : Reply as File
$app->post("", function (Request $request, Response $response) {

});

// func : Reply as Text
$app->post("", function (Request $request, Response $response) {

});


/////*Doing Unfollow*/////
// func : Get Account Details
$app->post("", function (Request $request, Response $response) {

});

// func : Get Following List
$app->post("", function (Request $request, Response $response) {

});

// func : Unfollow
$app->post("", function (Request $request, Response $response) {

});



/////*Find Friend*/////
// func : Get Events
$app->post("", function (Request $request, Response $response) {

});

// func : Search Friends
$app->post("", function (Request $request, Response $response) {

});


/////*Follow Someone*/////

//->Find Friend <-//

// func : Get Member Details
$app->post("", function (Request $request, Response $response) {

});

// func : Send Follow
$app->post("", function (Request $request, Response $response) {

});



/////*Like*/////
// func : Like
$app->post("", function (Request $request, Response $response) {

});


/////*Logs*/////
// func : Get Logs
$app->post("", function (Request $request, Response $response) {

});

// func : Get Post Details
$app->post("", function (Request $request, Response $response) {

});


/////*Search*/////
// func : Search
$app->post("", function (Request $request, Response $response) {

});

// func : Get Post Details
$app->post("", function (Request $request, Response $response) {

});



/////*See followers*/////
// func : Get Followers List
$app->post("", function (Request $request, Response $response) {

});


/////*See followings*/////
// func : Get followings List
$app->post("", function (Request $request, Response $response) {

});


/////*See Suggestions*/////
// func : Get Events
$app->post("", function (Request $request, Response $response) {

});


// func : Get Suggestions  -- top side --
$app->post("", function (Request $request, Response $response) {

});



/////*See Viral*/////
// func : Get Viral
$app->post("", function (Request $request, Response $response) {

});

// func : Get Post Details
$app->post("", function (Request $request, Response $response) {

});


/////*Share*/////
// func : Share
$app->post("", function (Request $request, Response $response) {

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