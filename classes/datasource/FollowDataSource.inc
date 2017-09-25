<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Follow.inc';
require_once 'LoginDataSource.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class FollowDataSource
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

    public function getFollowersRequests($memberId)
    {
        $sql = "SELECT * FROM Follows INNER JOIN Members On Follows.Member = Members.MemberId  WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Request'";
        $result = $this->da->execSelect($sql);
        $requests = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $request = new Follow();
                $request->setFollowId($row['FollowId']);
                $request->setMember($row['Member']);

                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);

                $request->setMember($member);
                $request->setSituation($row['Situation']);
                $request->setTime($row['Time']);
                $requests[] = $request;
            }
        }
        return $requests;
    }

    public function getFollowers($memberId)
    {

        $sql = "SELECT * FROM Follows INNER JOIN Members On Follows.Member = Members.MemberId WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Confirm'";
        //$sql = "SELECT * FROM Follows WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Confirm'";

        $result = $this->da->execSelect($sql);
        $requests = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $request = new Follow();
                $request->setFollowId($row['FollowId']);

                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);

                $request->setMember($member);

                $request->setSituation($row['Situation']);
                $request->setTime($row['Time']);
                $requests[] = $request;
            }
        }
        return $requests;
    }

    public function getFollowersCount($memberId)
    {
        $sql = "SELECT COUNT (*) as cnt FROM Follows WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Confirm'";
        $result = $this->da->execSelect($sql);
        $requests = array();
        $cnt = 0;
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $cnt = $row['cnt'];
            }
        }
        return cnt;
    }


    public function getFollowings($memberId)
    {
        //$sql = "SELECT * FROM Follows WHERE  Follows.Member=$memberId AND Follows.Situation = 'Confirm'";
        $sql = "SELECT * FROM Follows INNER JOIN Members On Follows.Object = Members.MemberId WHERE Follows.Member=$memberId AND Follows.Situation = 'Confirm'";
        //$sql = "SELECT * FROM Follows WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Confirm'";

        $result = $this->da->execSelect($sql);
        $requests = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $request = new Follow();
                $request->setFollowId($row['FollowId']);

                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);

                $request->setMember($member);

                $request->setSituation($row['Situation']);
                $request->setTime($row['Time']);
                $requests[] = $request;
            }
        }
        return $requests;
    }

    public function getFollowingsCount($memberId)
    {
        $sql = "SELECT COUNT (*) as cnt FROM Follows WHERE  Follows.Member=$memberId AND Follows.Situation = 'Confirm'";
        $result = $this->da->execSelect($sql);
        $requests = array();
        $cnt = 0;
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $cnt = $row['cnt'];
            }
        }
        return $cnt;
    }

    public function confirmRequest($object, $memberId)
    {
        $sql = "UPDATE Follows SET Situation='Confirm' WHERE Follows.ObjectType='Member' AND Follows.Object=$object AND Follows.Member = $memberId ";
        $this->da->exec($sql);
        return true;

    }

    public function followOrNot($object, $memberId)
    {
        $sql = "SELECT * FROM Follows WHERE Object='$object' AND Member = '$memberId'";
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) == 0) {
            $this->follow($object, $memberId);
            return true;
        } else {
            $this->unfollow($object, $memberId);
            return false;
        }
    }

    public function follow($object, $memberId)
    {
        $sql = "INSERT INTO Follows (Object , Member , ObjectType, Situation,) VALUES ('$object','$memberId','Member','Request')";
        $this->da->exec($sql);
        return true;
    }

    public function unfollow($object, $memberId)
    {
        $sql = "DELETE FROM Follows WHERE Object='$object' AND Member = '$memberId'";
        $this->da->exec($sql);
        return true;
    }


    public function rejectRequest($object, $memberId)
    {
        $sql = "UPDATE Follows SET Situation='Reject' WHERE Follows.ObjectType='Member' AND Follows.Object=$object AND Follows.Member = $memberId ";
        $this->da->exec($sql);
        return true;

    }

}