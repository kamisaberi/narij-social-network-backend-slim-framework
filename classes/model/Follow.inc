<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/11/2017
 * Time: 4:02 AM
 */
class Follow implements \JsonSerializable
{

    /**
     * @var int
     */
    private $followId;
    /**
     * @var int
     */
    private $member;
    /**
     * @var int
     */
    private $object;
    /**
     * @var string
     */
    private $objectType;
    /**
     * @var string
     */
    private $situation;
    /**
     * @var string
     */
    private $time;

    /**
     * @return int
     */
    public function getFollowId()
    {
        return $this->followId;
    }

    /**
     * @param int $followId
     */
    public function setFollowId($followId)
    {
        $this->followId = $followId;
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
     * Follow constructor.
     */
    public function __construct()
    {
        $this->followId = 0;
        $this->member = 0;
        $this->object = 0;
        $this->objectType = "Member";
        $this->situation = "Request";
        $this->time = "";
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