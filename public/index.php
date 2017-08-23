<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


require '../vendor/autoload.php';


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
$app->post("/register/enterphonenumber", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('phone'))) {
        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        $token = bin2hex(random_bytes(64));
        $response = array();
        $response["error"] = false;
        $response["message"] = $token;
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));
    }
});

//activity_login_signup
$app->post("/register/confirmverificationcode", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('token', 'verificationCode'))) {
        $requestData = $request->getParsedBody();
        $phone = $requestData['phone'];
        //$token = bin2hex(openssl_random_pseudo_bytes(64));  //PHP 7
        $token = bin2hex(random_bytes(64));
        $response = array();
        $response["error"] = false;
        $response["message"] = "successful";
        //echo json_encode($response);
        $response->getBody()->write(json_encode($response));
    }
});

//activity_create_password
$app->post("/register/createpassword", function (Request $request, Response $response) {



});


//activity_login_signup
$app->post("/login", function (Request $request, Response $response) {

    if (isTheseParametersAvailable(array('username', 'email'))) {


    }
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


});


//activity_confirm_phone_number
$app->post("/confirmphonenumber", function (Request $request, Response $response) {


});


//activity_create_password
$app->post("createpassword", function (Request $request, Response $response) {

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

});

$app->post("/profile/set", function (Request $request, Response $response) {

});

$app->post("/profile/set/email", function (Request $request, Response $response) {

});

$app->post("/profile/set/fullname", function (Request $request, Response $response) {

});

$app->post("/profile/set/location", function (Request $request, Response $response) {

});

$app->post("/profile/set/photo", function (Request $request, Response $response) {

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