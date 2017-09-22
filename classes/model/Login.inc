<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 9/10/2017
 * Time: 8:11 AM
 */
class Login implements \JsonSerializable
{

    /**
     * @var int
     */
    private $loginId;
    /**
     * @var string
     */
    private $token;
    /**
     * @var string
     */
    private $description;
    /**
     * @var string
     */
    private $loginTime;
    /**
     * @var int
     */
    private $memberId;

    /**
     * @var string
     */
    private $IP;

    /**
     * @return string
     */
    public function getIP()
    {
        return $this->IP;
    }

    /**
     * @param string $IP
     */
    public function setIP($IP)
    {
        $this->IP = $IP;
    }

    /**
     * Login constructor.
     * @param $loginId
     * @param $token
     * @param $description
     * @param $loginTime
     * @param $memberId
     */
    public function __construct()
    {
        $this->loginId = 0;
        $this->token = "";
        $this->description = "";
        $this->loginTime = "";
        $this->memberId = 0;
        $this->IP= "";
    }

    /**
     * @return int
     */
    public function getLoginId()
    {
        return $this->loginId;
    }

    /**
     * @param int $loginId
     */
    public function setLoginId($loginId)
    {
        $this->loginId = $loginId;
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
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return string
     */
    public function getLoginTime()
    {
        return $this->loginTime;
    }

    /**
     * @param string $loginTime
     */
    public function setLoginTime($loginTime)
    {
        $this->loginTime = $loginTime;
    }

    /**
     * @return int
     */
    public function getMemberId()
    {
        return $this->memberId;
    }

    /**
     * @param int $memberId
     */
    public function setMemberId($memberId)
    {
        $this->memberId = $memberId;
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