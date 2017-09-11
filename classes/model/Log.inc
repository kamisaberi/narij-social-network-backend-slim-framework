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
    private $description;

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
     * Log constructor.
     */
    public function __construct()
    {
        $this->logId = 0;
        $this->description = "";
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