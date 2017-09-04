<?php


class SmsSender
{
    public $USERNAME = '09113334886';  // your username (fill it with your username)
    public $PASSWORD = '27563158'; // your password (fill it with your password)

    // base http url
    private $BASE_HTTP_URL = "http://www.sibsms.com/APISend.aspx?";

    public function enqueueSample($recipientNumber, $message)
    {
        $USERNAME = "09113334886";  // your username (fill it with your username)
        $PASSWORD = "27563158"; // your password (fill it with your password)        $senderNumber = "30007546"; // [FILL] sender number ; which is your 3000xxx number
        //$recipientNumber = "0912XXXXXXX"; // [FILL] recipient number; the mobile number which will receive the message (e.g 0912XXXXXXX)
        $message = urlencode($message); // [FILL] the content of the message; (in url-encoded format !)
        //"your Verification Code is $veficationCode"
        $senderNumber = '50002060388143';
        // creating the url based on the information above
        $url = $this->BASE_HTTP_URL . "Username=" . $this->USERNAME . "&Password=" . $this->PASSWORD . "&From=" . $senderNumber . "&To=" . $recipientNumber . "&Text=" . $message;
        // sending the request via http call
        $result = $this->call($url);
        return $result;
        // Now you can compare the response with 0 or 1
    }

    // this method provides a simple way of calling a url
    private function call($url)
    {
        return file_get_contents($url);
    }

}

