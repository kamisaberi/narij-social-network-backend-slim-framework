<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Login.inc';
require_once 'LoginDataSource.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class LikeDataSource
{
    public $da;

    function __construct()
    {
        $this->da = new DataAccess();
    }

    public function open()
    {
        $this->da->open();
    }

    public function close()
    {
        $this->da->close();
    }

    public function like($postId, $token)
    {

        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();
        $id = 0;
        $sql = "INSERT INTO Likes ( `Member`,`Post`, `Token` ) VALUES ('{$memberId}' , '{$postId}', '{$token}')";
        $id = $this->da->exec($sql);
        return $id;
    }


}