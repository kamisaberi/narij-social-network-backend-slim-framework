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
class PostCategoryDataSource
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


    public function getPostCategories()
    {
        $sql = "SELECT * FROM postcategories";
        $result = $this->da->execSelect($sql);
        $posts= array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $post = new PostCategory();
                $post ->setPostCategoryId($row['PostCategoryId']);
                $post->setTitle($row['Title']);
                $posts[] = $post;
            }
        }
        return $posts;
    }

}