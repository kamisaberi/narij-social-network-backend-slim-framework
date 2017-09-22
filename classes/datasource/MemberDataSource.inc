<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Member.inc';
require_once __DIR__ . '/../datasource/LoginDataSource.inc';

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


    public function getProfileBasedOnToken($token)
    {
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $sql = "SELECT * FROM NARIJ_00003.Members WHERE Members.MemberId={$memberId}";
        $result = $this->da->execSelect($sql);
        $member = new Member();

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $member->setMemberId($memberId);
                $member->setFullName($row["FullName"]);
                $member->setPhone($row["Phone"]);
                $member->setEmail($row["Email"]);
                return $member;
            }
        } else {
            $member->setMemberId(0);
            return $member;
        }
    }

    public function getProfile($memberId)
    {
        $sql = "SELECT * FROM NARIJ_00003.Members WHERE Members.MemberId={$memberId}";
        $result = $this->da->execSelect($sql);
        $member = new Member();

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $member->setMemberId($memberId);
                $member->setFullName($row["FullName"]);
                $member->setPhone($row["Phone"]);
                $member->setEmail($row["Email"]);
                return $member;
            }
        } else {
            $member->setMemberId(0);
            return $member;
        }
    }


    public function updateProfile($token, Member $member)
    {
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();
        $sql = "UPDATE Members  SET Members.FullName='{$member->getFullName()}' , Members.Email = '{$member->getEmail()}' WHERE Members.MemberId= $memberId";
        $this->da->exec($sql);
        return true;
    }

    public function updateProfileFullName($phone, $fullName)
    {
        $sql = "UPDATE NARIJ_00005.Members  SET Members.FullName='{$fullName}'  WHERE Members.Phone= '$phone'";
        $this->da->exec($sql);
        return true;
    }

    public function updateProfileEmail($phone, $email)
    {
        $sql = "UPDATE Members  SET Members.Email='{$email}'  WHERE Members.Phone= '$phone'";
        $this->da->exec($sql);
        return true;
    }

    public function updateProfilePhoto($token, $photo)
    {
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();
        $sql = "UPDATE Members  SET Members.Email='{$photo}'  WHERE Members.MemberId= $memberId";
        $this->da->exec($sql);
        return true;
    }

    public function updateProfileLocation($token, $location)
    {
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();
        $sql = "UPDATE Members  SET Members.Email='{$location}'  WHERE Members.MemberId= $memberId";
        $this->da->exec($sql);
        return true;
    }


    public function enterPhoneNumber(Member $member)
    {
        $id = 0;
        $sql = "INSERT INTO Members ( `Phone`,`VerificationCode` ) VALUES ('{$member->getPhone()}' , '{$member->getVerificationCode()}')";
        //echo $sql;
        $id = $this->da->exec($sql);
        return $id;
    }

    public function checkVerificationCode(Member $member)
    {
        $sql = "SELECT * FROM NARIJ_00005.Members WHERE Members.Phone = '{$member->getPhone()}' AND Members.VerificationCode = '{$member->getVerificationCode()}' ";
        //echo $sql;
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {

            while ($row = mysqli_fetch_assoc($result)) {
                $sql = "UPDATE Members SET Members.Active = 1 WHERE Members.MemberId = {$row['MemberId']}";
                $this->da->exec($sql);
            }
            return true;
        } else {
            return false;
        }
    }

    public function createPassword(Member $member)
    {
        $sql = "UPDATE Members SET Members.Password= '{$member->getPassword()}' WHERE Members.Phone = '{$member->getPhone()}'";
        $this->da->execSelect($sql);
        return true;

    }


    public function checkPassword(Member $member)
    {
        $sql = "SELECT * FROM Members WHERE Members.MemberId = '{$member->getMemberId()}' AND Members.Password = '{$member->getPassword()}' ";
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getMember($memberId)
    {
        $sql = "SELECT * FROM Members WHERE Members.MemberId = '{$memberId}' ";
        $result = $this->da->execSelect($sql);
        $member = new Member();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $member->setMemberId($memberId);
                $member->setFullName($row["FullName"]);
                $member->setPhone($row["Phone"]);
                $member->setEmail($row["Email"]);
            }
        }
        return $member;
    }

    public function search($text)
    {
        $sql = "SELECT * FROM Members WHERE Members.FullName LIKE '%$text%'";
        $result = $this->da->execSelect($sql);
        $members = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row["FullName"]);
                $member->setPhone($row["Phone"]);
                $member->setEmail($row["Email"]);
                $members[] = $member;
            }
        }
        return $members;
    }


    public function suggest()
    {
        $sql = "SELECT * FROM Members ";
        $result = $this->da->execSelect($sql);
        $members = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setEmail($row['Email']);
                $member->setPhone($row['Phone']);
                $members[] = $member;
            }
        }
        return $members;
    }


    public function changePassword(Member $member)
    {
        $sql = "UPDATE Members SET Members.Password= '{$member->getPassword()}' WHERE Members.MemberId = {$member->getMemberId()}";
        $this->da->execSelect($sql);
    }


    public function getVerificationCode($phoneNumber)
    {


    }


    public function login(Member $member)
    {
        $sql = "SELECT * FROM Members WHERE Members.Phone = '{$member->getPhone()}' AND Members.Password = '{$member->getPassword()}'";
        echo nl2br("\n$sql\n");
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $memberId = $row['MemberId'];
                return $memberId;
            }
        } else {
            return 0;
        }
    }


}