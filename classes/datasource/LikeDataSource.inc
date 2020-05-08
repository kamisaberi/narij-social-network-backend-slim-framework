<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Login.inc';
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

    public function like($postId, $token, $value)
    {

        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();
        $id = 0;

        if ($value == 1) {
            $sql = "INSERT INTO Likes ( `Member`,`Post`, `Token` ) VALUES ('{$memberId}' , '{$postId}', '{$token}')";
        } else {
            $sql = "DELETE FROM  Likes WHERE `Member` = {$memberId} AND `Post` = {$postId}";
        }
        $id = $this->da->exec($sql);
        return $id;
    }


}