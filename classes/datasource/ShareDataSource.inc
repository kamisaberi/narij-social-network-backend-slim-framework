<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Share.inc';
require_once 'LoginDataSource.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class ShareDataSource
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


    public function share($token, $receiver, $post)
    {
        $lds = new LoginDataSource();
        $lds->open();
        $sender = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $sql = "INSERT INTO Shares (`Sender`,`Receiver`,`Post`) VALUES  ('$sender','$receiver','$post')";
        $this->da->exec($sql);
        return true;
    }


}