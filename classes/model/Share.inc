<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/11/2017
 * Time: 12:52 AM
 */
class Share implements \JsonSerializable
{

    /**
     * @var int
     */
    private $shareId;
    /**
     * @var int
     */
    private $post;
    /**
     * @var int
     */
    private $sender;
    /**
     * @var int
     */
    private $receiver;
    /**
     * @var string
     */
    private $time;

    /**
     * Share constructor.
     */
    public function __construct()
    {
        $this->shareId = 0;
        $this->post = 0;
        $this->sender = 0;
        $this->receiver = 0;
        $this->time = "";
    }

    /**
     * @return int
     */
    public function getShareId()
    {
        return $this->shareId;
    }

    /**
     * @param int $shareId
     */
    public function setShareId($shareId)
    {
        $this->shareId = $shareId;
    }

    /**
     * @return int
     */
    public function getPost()
    {
        return $this->post;
    }

    /**
     * @param int $post
     */
    public function setPost($post)
    {
        $this->post = $post;
    }

    /**
     * @return int
     */
    public function getSender()
    {
        return $this->sender;
    }

    /**
     * @param int $sender
     */
    public function setSender($sender)
    {
        $this->sender = $sender;
    }

    /**
     * @return int
     */
    public function getReceiver()
    {
        return $this->receiver;
    }

    /**
     * @param int $receiver
     */
    public function setReceiver($receiver)
    {
        $this->receiver = $receiver;
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