<?php

require_once 'MediaType.inc';
require_once 'PostCategory.inc';

/**
 *
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 6:48 AM
 */
class Post implements \JsonSerializable
{

    /**
     * @var int
     */
    private $postId;
    /**
     * @var MediaType
     */
    private $mediaType;
    /**
     * @var string
     */
    private $createTime;
    /**
     * @var string
     */
    private $editTime;
    /**
     * @var string
     */
    private $deleteTime;
    /**
     * @var bool
     */
    private $deleted;
    /**
     * @var PostCategory
     */
    private $postCategory;

    private $properties;

    /**
     * Post constructor.
     */
    public function __construct()
    {
        $this->postId = 0;
        $this->mediaType = new MediaType();
        $this->createTime = '';
        $this->editTime = '';
        $this->deleteTime = '';
        $this->deleted = false;
        $this->postCategory = new PostCategory();
        $this->properties = array();
    }

    /**
     * @return array
     */
    public function getProperties()
    {
        return $this->properties;
    }

    /**
     * @param array $properties
     */
    public function setProperties($properties)
    {
        $this->properties = $properties;
    }

    /**
     * @return int
     */
    public function getPostId()
    {
        return $this->postId;
    }

    /**
     * @param int $postId
     */
    public function setPostId($postId)
    {
        $this->postId = $postId;
    }

    /**
     * @return MediaType
     */
    public function getMediaType()
    {
        return $this->mediaType;
    }

    /**
     * @param MediaType $mediaType
     */
    public function setMediaType($mediaType)
    {
        $this->mediaType = $mediaType;
    }

    /**
     * @return string
     */
    public function getCreateTime()
    {
        return $this->createTime;
    }

    /**
     * @param string $createTime
     */
    public function setCreateTime($createTime)
    {
        $this->createTime = $createTime;
    }

    /**
     * @return string
     */
    public function getEditTime()
    {
        return $this->editTime;
    }

    /**
     * @param string $editTime
     */
    public function setEditTime($editTime)
    {
        $this->editTime = $editTime;
    }

    /**
     * @return string
     */
    public function getDeleteTime()
    {
        return $this->deleteTime;
    }

    /**
     * @param string $deleteTime
     */
    public function setDeleteTime($deleteTime)
    {
        $this->deleteTime = $deleteTime;
    }

    /**
     * @return bool
     */
    public function isDeleted()
    {
        return $this->deleted;
    }

    /**
     * @param bool $deleted
     */
    public function setDeleted($deleted)
    {
        $this->deleted = $deleted;
    }

    /**
     * @return PostCategory
     */
    public function getPostCategory()
    {
        return $this->postCategory;
    }

    /**
     * @param PostCategory $postCategory
     */
    public function setPostCategory($postCategory)
    {
        $this->postCategory = $postCategory;
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
        // TODO: Implement jsonSerialize() method.
    }
}