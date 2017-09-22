<?php

require_once 'Member.inc';

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
     * @var string
     */
    private $situation;
    /**
     * @var string
     */
    private $time;

    /**
     * Follow constructor.
     */
    public function __construct()
    {
        $this->followId = 0;
        $this->member = new Member();
        $this->situation = "Request";
        $this->time = "";
    }

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