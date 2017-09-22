<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Comment.inc';
require_once 'LoginDataSource.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class CommentDataSource
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


    public function comment(Comment $comment)
    {
        $sql = "INSERT INTO Comments(Content, Member, Object, ObjectType, Parent, Situation) VALUES  ('{$comment->getContent()}','{$comment->getMember()}','{$comment->getObject()}','Post','{$comment->getParent()}','Allowed')";
        $this->da->exec($sql);
        return true;
    }

    public function getCommnetsByPostId($postId)
    {
        $sql = "SELECT * FROM Comments WHERE ObjectType='Post' AND Object='$postId' AND Situation='Allowed'";
        $result = $this->da->execSelect($sql);
        $comments = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $comment = new Comment();
            $comment->setCommentId($row["CommentId"]);
            $comment->setContent($row["Content"]);
            $comment->setMember($row["Member"]);
            $comment->setTime($row["Time"]);
            $comment->setObjectType($row["ObjectType"]);
            $comment->setObject($row["Object"]);
            $comment->setParent($row["Parent"]);
            $comment->setSituation($row["Situation"]);
            $comments[] = $comment;
        }

        return $comments;
    }


}