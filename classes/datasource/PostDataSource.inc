<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Post.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class PostDataSource
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


    public function getPost($postId)
    {
        $sql = "SELECT * FROM Posts WHERE Posts.PostId='$postId'";
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $post = new Post();
                $post->setPostId($postId);
                $post->setDeleteTime($row['DeleteTime']);
                $post->setTitle($row['Title']);
                $post->setDescription($row['Description']);
                $post->setDeleteTime($row['DeleteTime']);
                $post->setCreateTime($row['CreateTime']);
                $post->setEditTime($row['EditTime']);
                return $post;
            }
        } else {
            return 0;
        }
    }


    public function search($text)
    {
        $sql = "SELECT * FROM Posts WHERE Posts.Title   LIKE '%$text%'";
        $result = $this->da->execSelect($sql);
        $posts = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $post = new Post();
                $post->setPostId($row['PostId']);
                $post->setTitle($row['Title']);
                $post->setDescription($row['Description']);
                $post->setDeleteTime($row['DeleteTime']);
                $post->setCreateTime($row['CreateTime']);
                $post->setEditTime($row['EditTime']);
                $posts[] = $post;
            }
        }
        return $posts;
    }

}