<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/15/2017
 * Time: 6:10 AM
 */
class Tag implements \JsonSerializable
{

    /**
     * @var int
     */
    private  $tagId;
    /**
     * @var string
     */
    private  $title;

    /**
     * @return int
     */
    public function getTagId()
    {
        return $this->tagId;
    }

    /**
     * @param int $tagId
     */
    public function setTagId($tagId)
    {
        $this->tagId = $tagId;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * Tag constructor.
     */
    public function __construct()
    {
        $this->tagId = 0;
        $this->title= "";
    }


    /**
     * Specify data which should be serialized to JSON
     * @link http://php.net/manual/en/jsonserializable.jsonserialize.php
     * @return mixed data which can be serialized by <b>json_encode</b>,
     * which is a value of any type other than a resource.
     * @since 5.4.0
     */
    function jsonSerialize()
    {
        return get_object_vars($this);
        // TODO: Implement jsonSerialize() method.
    }
}