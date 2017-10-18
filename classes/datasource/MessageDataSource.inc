<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Message.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class MessageDataSource
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


    public function getMessages($memberId)
    {
        $sql = "SELECT
Messages.MessageId,
Messages.Member,
Messages.Object,
Messages.ObjectType,
Messages.Content,
Messages.Time,
Messages.Parent,
Members.MemberId,
Members.FullName,
Members.Phone,
Members.Email,
Members.`Password`
FROM Messages INNER JOIN Members On Messages.Member = Members.MemberId WHERE Messages.ObjectType='Member' AND  Object='$memberId'";
echo "<br>$sql<br>";
        $result = $this->da->execSelect($sql);
        $messages = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $message = new Message();
                $message->setMessageId($row['MessageId']);
                $message->setContent($row['Content']);
                $message->setTime($row['Time']);
                $message->setParent($row['Parent']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);
                $message->setMember($member);
                $messages[] = $message;
            }
        }
        return $messages;
    }


    public function getConversation($me, $memberId)
    {
        $sql = "SELECT
Messages.MessageId,
Messages.Member,
Messages.Object,
Messages.ObjectType,
Messages.Content,
Messages.Time,
Messages.Parent,
Members.MemberId,
Members.FullName,
Members.Phone,
Members.Email,
Members.`Password`
FROM Messages INNER JOIN Members On Messages.Member = Members.MemberId WHERE Messages.ObjectType='Member' AND  (Object='$memberId' OR Object='$me')";

        $result = $this->da->execSelect($sql);
        $messages = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $message = new Message();
                $message->setMessageId($row['MessageId']);
                $message->setContent($row['Content']);
                $message->setTime($row['Time']);
                $message->setParent($row['Parent']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);
                $message->setMember($member);
                $messages[] = $message;
            }
        }
        return $messages;
    }


}



