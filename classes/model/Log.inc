<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/11/2017
 * Time: 3:17 AM
 */
class Log implements \JsonSerializable
{

    /**
     * @var int
     */
    private $logId;
    /**
     * @var string
     */
    private $content;
    /**
     * @var Member
     */
    private $member;
    /**
     * @var string
     */
    private $time;
    /**
     * @var int
     */
    private $parent;

    /**
     * Log constructor.
     */
    public function __construct()
    {
        $this->logId = 0;
        $this->content = "";
        $this->member = new Member();
        $this->time = "";
        $this->parent = 0;
    }

    /**
     * @return int
     */
    public function getLogId()
    {
        return $this->logId;
    }

    /**
     * @param int $logId
     */
    public function setLogId($logId)
    {
        $this->logId = $logId;
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
     * @return Member
     */
    public function getMember()
    {
        return $this->member;
    }

    /**
     * @param Member $member
     */
    public function setMember($member)
    {
        $this->member = $member;
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
     * @return array
     */
    function jsonSerialize()
    {
        return get_object_vars($this);
        // TODO: Implement jsonSerialize() method.
    }
}