<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Tag.inc';
require_once 'LoginDataSource.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class TagDataSource
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


    public function create(Tag $tag)
    {
        $sql = "INSERT INTO Tags (Title) VALUES ('{$tag->getTitle()}')";
        return $this->da->exec($sql);
    }

    public function assignTagsToPost($tags, $postId)
    {
        foreach ($tags as $tag) {

            $sql = "SELECT TagId FROM Tags WHERE Title='$tag'";
            $result = $this->da->execSelect($sql);
            $tagId = 0;
            if (mysqli_num_rows($result) > 0) {

                while ($row = mysqli_fetch_assoc($result)) {
                    $tagId = $row['TagId'];
                    break;
                }
            } else {
                $tagId = $this->createWithTitle($tag);
            }

            $sql = "INSERT INTO PostTag (Post, Tag) VALUES ('$postId','$tagId')";
            $this->da->exec($sql);
        }
    }

    public function createWithTitle($title)
    {
        $sql = "INSERT INTO Tags (Title) VALUES ('{$title}')";
        return $this->da->exec($sql);
    }


}