<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Log.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class LogDataSource
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


    public function getLogs($memberId)
    {
        $sql = "SELECT
`Logs`.LogId,
`Logs`.Member,
`Logs`.Object,
`Logs`.ObjectType,
`Logs`.Content,
`Logs`.Time,
`Logs`.Parent,
Members.MemberId,
Members.FullName,
Members.Phone,
Members.Email,
Members.`Password`
FROM `Logs` INNER JOIN Members On `Logs`.Member = Members.MemberId";


//        echo nl2br("\n$sql\n");
        $result = $this->da->execSelect($sql);
        $logs = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $log = new Log();
                $log->setLogId($row['LogId']);
                $log->setContent($row['Content']);
                $log->setTime($row['Time']);
                $log->setParent($row['Parent']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);
                $log->setMember($member);
                $logs[] = $log;
            }
        }
        return $logs;
    }


    public function createLogForLikePost($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId Liked $object')";
        $this->da->exec($sql);
    }

    public function createLogForFollow($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Followed $object')";
        $this->da->exec($sql);
    }

    public function createLogForUnfollow($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Unfollowed $object')";
        $this->da->exec($sql);
    }

    public function createLogForReject($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Rejected $object')";
        $this->da->exec($sql);
    }

    public function createLogForCreatingTextPost($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId Cerates $object Text Post')";
        $this->da->exec($sql);
    }

    public function createLogForCreatingPost($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId Cerates $object Post')";
        $this->da->exec($sql);
    }

    public function createLogForCreatingImagePost($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId Cerates $object Image Post')";
        $this->da->exec($sql);
    }

    public function createLogForCreatingAudioPost($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId Cerates $object Audio Post')";
        $this->da->exec($sql);
    }

    public function createLogForCreatingVideoPost($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId Cerates $object Video Post')";
        $this->da->exec($sql);
    }

    public function createLogForSeeMemberProfile($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Saw $object Profile')";
        $this->da->exec($sql);
    }

    public function createLogForSharePost($object, $memberId, $receiver)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Post', '$memberId shared $object To $receiver')";
        $this->da->exec($sql);
    }

    public function createLogForConfirmFollowRequest($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Confirmed $object Follow Request')";
        $this->da->exec($sql);
    }

    public function createLogForRejectFollowRequest($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Rejected $object Follow Request')";
        $this->da->exec($sql);
    }

    public function createLogForUnfollowFollowRequest($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId UnFollowed $object Follow Request')";
        $this->da->exec($sql);
    }

    public function createLogForRequest($object, $memberId)
    {
        $sql = "INSERT INTO Logs (Member, Object, ObjectType, Content) VALUES ('$memberId','$object', 'Member', '$memberId Requested $object Follow Request')";
        $this->da->exec($sql);
    }


}