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

    public function checkVerificationCode(Member $member)
    {
        $sql = "SELECT * FROM Members WHERE Members.Mobile = '{$member->getPhone()}' AND Members.Password = '{$member->getPassword()}' ";
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {
            $sql = "UPDATE Members SET Members.Active = 1 WHERE Members.MemberId = {$result['MemberId']}";
            $this->da->execSelect($sql);
            return true;
        } else {
            return false;
        }
    }

    public function createPassword(Member $member)
    {
        $sql = "UPDATE Members SET Members.Password= '{$member->getPassword()}' WHERE Members.MemberId = {$member->getMemberId()}";
        $this->da->execSelect($sql);

    }



    public function getVerificationCode($phoneNumber)
    {


    }


    public function login(Member $member)
    {
        $sql = "SELECT * FROM Members WHERE Members.Mobile = '{$member->getPhone()}' AND Members.Password = '{$member->getPassword()}')";
        $result = $this->da->execSelect($sql);

        if (mysqli_num_rows($result) > 0) {
            return true;
        } else {
            return false;
        }
    }


}