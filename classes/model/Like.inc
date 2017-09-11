<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/10/2017
 * Time: 10:02 AM
 */
class Like implements \JsonSerializable
{

    /**
     * @var int
     */
    private $likeId;
    /**
     * @var int
     */
    private $value;
    /**
     * @var int
     */
    private $member;
    /**
     * @var int
     */
    private $post;
    /**
     * @var string
     */
    private $token;
    /**
     * @var string
     */
    private $date;

    /**
     * Like constructor.
     */
    public function __construct()
    {
        $this->likeId = 0;
        $this->value = 0;
        $this->member = 0;
        $this->post = 0;
        $this->date = "";
        $this->token = "";
    }

    /**
     * @return int
     */
    public function getLikeId()
    {
        return $this->likeId;
    }

    /**
     * @param int $likeId
     */
    public function setLikeId($likeId)
    {
        $this->likeId = $likeId;
    }

    /**
     * @return int
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * @param int $value
     */
    public function setValue($value)
    {
        $this->value = $value;
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
     * @return string
     */
    public function getToken()
    {
        return $this->token;
    }

    /**
     * @param string $token
     */
    public function setToken($token)
    {
        $this->token = $token;
    }

    /**
     * @return string
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param string $date
     */
    public function setDate($date)
    {
        $this->date = $date;
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