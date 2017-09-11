<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Comment.inc';
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

}