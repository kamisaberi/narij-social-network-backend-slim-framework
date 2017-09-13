<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Post.inc';
require_once 'CommentDataSource.inc';

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


    public function getPost($postId, $comments = false)
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

                if ($comments == true) {
                    $cds = new CommentDataSource();
                    $cds->open();
                    $post->setComments($cds->getCommnetsByPostId($postId));
                    $cds->close();
                }

                return $post;
            }
        } else {
            return 0;
        }
    }

    public function getMemberPosts($memberId, $comments = false)
    {
        $sql = "SELECT
Posts.PostId,
Posts.Title,
Posts.Descruption,
Posts.MediaType,
Posts.CreateTime,
Posts.EditTime,
Posts.DeleteTime,
Posts.Deleted,
Posts.PostCategory
FROM
Posts
INNER JOIN MemberPost ON MemberPost.Post = Posts.PostId WHERE MemberPost.Member = {$memberId}";
        $result = $this->da->execSelect($sql);

        $posts = array();

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $post = new Post();
                $post->setPostId($row['PostId']);
                $post->setDeleteTime($row['DeleteTime']);
                $post->setTitle($row['Title']);
                $post->setDescription($row['Description']);
                $post->setDeleteTime($row['DeleteTime']);
                $post->setCreateTime($row['CreateTime']);
                $post->setEditTime($row['EditTime']);

                if ($comments == true) {
                    $cds = new CommentDataSource();
                    $cds->open();
                    $post->setComments($cds->getCommnetsByPostId($row['PostId']));
                    $cds->close();
                }
                $posts[] = $post;
            }
        }
        return $posts;
    }

    public function getMemberPostsCount($memberId)
    {
        $sql = "SELECT
COUNT(Posts.PostId) as cnt
FROM
Posts
INNER JOIN MemberPost ON MemberPost.Post = Posts.PostId WHERE MemberPost.Member = {$memberId}";
        $result = $this->da->execSelect($sql);
        $cnt = 0;
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $cnt = $row['cnt'];
            }
        }
        return $cnt;
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


    public function getViral()
    {
        $sql = "SELECT * FROM Posts ";
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