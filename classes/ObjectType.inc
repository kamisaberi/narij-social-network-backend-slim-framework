<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 6:43 AM
 */
class ObjectType implements \JsonSerializable
{


    private $objectTypeId;
    private $title;

    /**
     * MediaType constructor.
     */
    public function __construct()
    {
        $this->objectTypeId = 0;
        $this->title = '';
    }

    /**
     * @return int
     */
    public function getObjectTypeId()
    {
        return $this->objectTypeId;
    }

    /**
     * @param int $objectTypeId
     */
    public function setObjectTypeId($objectTypeId)
    {
        $this->objectTypeId = $objectTypeId;
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