<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Member.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class MemberDataSource
{
    public $da;

    function __construct()
    {
        $this->da = new DataAccess();
    }

    public function open()
    {
        $this->da->open();
    }

    public function close()
    {
        $this->da->close();
    }


    public function enterPhoneNumber(Member $member)
    {
        $id = 0;
        $sql = "INSERT INTO Members ( `Phone`,`VerificationCode` ) VALUES ('{$member->getPhone()}' , '{$member->getVerificationCode()}')";
        $id = $this->da->exec($sql);
        return $id;
    }

    public function getVerificationCode($phoneNumber)
    {


    }


}