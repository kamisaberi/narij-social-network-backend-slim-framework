<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Post.inc';
require_once 'CommentDataSource.inc';
require_once 'TagDataSource.inc';

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
Posts.Description,
Posts.MediaType,
Posts.CreateTime,
Posts.EditTime,
Posts.DeleteTime,
Posts.Deleted,
Posts.PostCategory,
Posts.Member,
Members.MemberId,
Members.FullName,
Members.`Profile`,
Members.Sex,
Members.BirthDate,
Members.Address,
Members.Phone,
Members.Username,
Members.Email,
Members.`Password`,
Members.MemberType,
Members.VerificationCode,
Members.Active,
Members.Parent
FROM
Posts
INNER JOIN Members ON Members.MemberId = Posts.Member WHERE MemberId = $memberId";
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
                $post->setMediaType($row['MediaType']);
                $post->setEditTime($row['EditTime']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setEmail($row['Email']);
                $member->setPhone($row['Phone']);
                $post->setMember($member);
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
        $sql = "SELECT
Posts.PostId,
Posts.Title,
Posts.Description,
Posts.MediaType,
Posts.CreateTime,
Posts.EditTime,
Posts.DeleteTime,
Posts.Deleted,
Posts.PostCategory,
Posts.Member,
Members.MemberId,
Members.FullName,
Members.`Profile`,
Members.Sex,
Members.BirthDate,
Members.Address,
Members.Phone,
Members.Username,
Members.Email,
Members.`Password`,
Members.MemberType,
Members.VerificationCode,
Members.Active,
Members.Parent
FROM
Posts
INNER JOIN Members ON Members.MemberId = Posts.Member WHERE Title LIKE '%$text%'";
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
                $post->setMediaType($row['MediaType']);
                $post->setEditTime($row['EditTime']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setEmail($row['Email']);
                $member->setPhone($row['Phone']);
                $post->setMember($member);

                $posts[] = $post;
            }
        }
        return $posts;
    }


    public function getViral($type)
    {
        $sql = "SELECT
Posts.PostId,
Posts.Title,
Posts.Description,
Posts.MediaType,
Posts.CreateTime,
Posts.EditTime,
Posts.DeleteTime,
Posts.Deleted,
Posts.PostCategory,
Posts.Member,
Members.MemberId,
Members.FullName,
Members.`Profile`,
Members.Sex,
Members.BirthDate,
Members.Address,
Members.Phone,
Members.Username,
Members.Email,
Members.`Password`,
Members.MemberType,
Members.VerificationCode,
Members.Active,
Members.Parent
FROM
Posts
INNER JOIN Members ON Members.MemberId = Posts.Member";

        if ($type != "All" && $type != "") {
            $sql .= " WHERE Posts.MediaType = '$type'";
        }

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
                $post->setMediaType($row['MediaType']);
                $post->setEditTime($row['EditTime']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setEmail($row['Email']);
                $member->setPhone($row['Phone']);
                $post->setMember($member);

                $posts[] = $post;
            }
        }
        return $posts;
    }

    public function getPosts()
    {
        $sql = "SELECT
Posts.PostId,
Posts.Title,
Posts.Description,
Posts.MediaType,
Posts.CreateTime,
Posts.EditTime,
Posts.DeleteTime,
Posts.Deleted,
Posts.PostCategory,
Posts.Member,
Members.MemberId,
Members.FullName,
Members.`Profile`,
Members.Sex,
Members.BirthDate,
Members.Address,
Members.Phone,
Members.Username,
Members.Email,
Members.`Password`,
Members.MemberType,
Members.VerificationCode,
Members.Active,
Members.Parent,
(SELECT COUNT(LikeId) FROM Likes WHERE Likes.Member = 410 AND Likes.Post = Posts.PostId) as Liked
FROM
Posts
INNER JOIN Members ON Members.MemberId = Posts.Member ORDER By  Posts.PostId DESC";
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
                $post->setMediaType($row['MediaType']);
                $post->setEditTime($row['EditTime']);

                if ($row['Liked'] == 0) {
                    $post->setLiked(false);
                } else {
                    $post->setLiked(true);
                }

                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setEmail($row['Email']);
                $member->setPhone($row['Phone']);
                $post->setMember($member);

                $posts[] = $post;
            }
        }
        return $posts;
    }


    public function create(Post $post, $memberId, $tags)
    {
        $sql = "INSERT INTO Posts (Title, Description, MediaType,Member) VALUES ('{$post->getTitle()}','{$post->getDescription()}','{$post->getMediaType()->getTitle()}', '$memberId')";
//        echo $sql;
        $id = $this->da->exec($sql);
//        $this->assignPostToMember($id, $memberId);

        $tags = explode("#", $tags);

        $tds = new TagDataSource();
        $tds->open();
        $tds->assignTagsToPost($tags, $id);
        $tds->close();
        return $id;

    }


    public function assignPostToMember($postId, $memberId)
    {
        $sql = "INSERT INTO MemberPost (Member, Post) VALUES ('$postId','$memberId')";
        $this->da->exec($sql);
    }


}