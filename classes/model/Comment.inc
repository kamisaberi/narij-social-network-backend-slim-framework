<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/11/2017
 * Time: 6:13 AM
 */
class Comment implements \JsonSerializable
{

    /**
     * @var int
     */
    private $commentId;
    /**
     * @var string
     */
    private $content;
    /**
     * @var int
     */
    private $member;
    /**
     * @var string
     */
    private $objectType;
    /**
     * @var int
     */
    private $object;
    /**
     * @var int
     */
    private $parent;
    /**
     * @var string
     */
    private $time;
    /**
     * @var string
     */
    private $situation;

    /**
     * Comment constructor.
     * @param $commentId
     * @param $content
     * @param $member
     * @param $objectType
     * @param $object
     * @param $parent
     * @param $time
     * @param $situation
     */
    public function __construct()
    {
        $this->commentId = 0;
        $this->content = "";
        $this->member = 0;
        $this->objectType = "Post";
        $this->object = 0;
        $this->parent = 0;
        $this->time = "";
        $this->situation = "Allowed";
    }

    /**
     * @return int
     */
    public function getCommentId()
    {
        return $this->commentId;
    }

    /**
     * @param int $commentId
     */
    public function setCommentId($commentId)
    {
        $this->commentId = $commentId;
    }

    /**
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * @param string $content
     */
    public function setContent($content)
    {
        $this->content = $content;
    }

    /**
     * @return int
     */
    public function getMember()
    {
        return $this->member;
    }

    /**
     * @param int $member
     */
    public function setMember($member)
    {
        $this->member = $member;
    }

    /**
     * @return string
     */
    public function getObjectType()
    {
        return $this->objectType;
    }

    /**
     * @param string $objectType
     */
    public function setObjectType($objectType)
    {
        $this->objectType = $objectType;
    }

    /**
     * @return int
     */
    public function getObject()
    {
        return $this->object;
    }

    /**
     * @param int $object
     */
    public function setObject($object)
    {
        $this->object = $object;
    }

    /**
     * @return int
     */
    public function getParent()
    {
        return $this->parent;
    }

    /**
     * @param int $parent
     */
    public function setParent($parent)
    {
        $this->parent = $parent;
    }

    /**
     * @return string
     */
    public function getTime()
    {
        return $this->time;
    }

    /**
     * @param string $time
     */
    public function setTime($time)
    {
        $this->time = $time;
    }

    /**
     * @return string
     */
    public function getSituation()
    {
        return $this->situation;
    }

    /**
     * @param string $situation
     */
    public function setSituation($situation)
    {
        $this->situation = $situation;
    }








//CommentId	bigint	20	0	0	-1	0	0	0		0					-1	0
//Content	text	0	0	0	0	0	0	0		0		utf8	utf8_persian_ci		0	0
//Member	bigint	20	0	0	0	0	0	0		0					0	0
//Time	timestamp	0	0	0	0	0	0	0	CURRENT_TIMESTAMP	0					0	0
//Object	bigint	20	0	0	0	0	0	0	0	0					0	0
//ObjectType	varchar	255	0	0	0	0	0	0		0		utf8	utf8_persian_ci		0	0
//Parent	bigint	20	0	0	0	0	0	0	0	0					0	0
//Situation	varchar	255	0	0	0	0	0	0	'1'	0		utf8	utf8_persian_ci		0	0

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