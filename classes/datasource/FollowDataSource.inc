<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Follow.inc';
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
        $sql = "SELECT * FROM Follows WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Request'";
        $result = $this->da->execSelect($sql);
        $requests = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $request = new Follow();
                $request->setFollowId($row['FollowId']);
                $request->setMember($row['Member']);
                $request->setObject($row['Object']);
                $request->setObjectType($row['ObjectType']);
                $request->setSituation($row['Situation']);
                $request->setTime($row['Time']);
                $requests[] = $request;
            }
        }
        return $requests;
    }

    public function getFollowers($memberId)
    {
        $sql = "SELECT * FROM Follows WHERE Follows.ObjectType='Member' AND Follows.Object=$memberId AND Follows.Situation = 'Confirm'";
        $result = $this->da->execSelect($sql);
        $requests = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $request = new Follow();
                $request->setFollowId($row['FollowId']);
                $request->setMember($row['Member']);
                $request->setObject($row['Object']);
                $request->setObjectType($row['ObjectType']);
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
        $cnt=0;
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $cnt= $row['cnt'];
            }
        }
        return cnt;
    }



    public function getFollowings($memberId)
    {
        $sql = "SELECT * FROM Follows WHERE  Follows.Member=$memberId AND Follows.Situation = 'Confirm'";
        $result = $this->da->execSelect($sql);
        $requests = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $request = new Follow();
                $request->setFollowId($row['FollowId']);
                $request->setMember($row['Member']);
                $request->setObject($row['Object']);
                $request->setObjectType($row['ObjectType']);
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

    public function follow($object, $memberId)
    {
        $sql = "INSERT INTO Follows (Object , Member , ObjectType, Situation,) VALUES ('$object','$memberId','Member','Request')";
        $this->da->exec($sql);
        return true;
    }

    public function unfollow($object, $memberId)
    {
        $sql = "DELETE FROM NARIJ_00003.Follows WHERE Object='$object' AND Member = '$memberId'";
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