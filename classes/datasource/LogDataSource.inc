<?php

require_once '../dataaccess/DataAccess.inc';
require_once '../model/Log.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class LogDataSource
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


    public function getLogs($token)
    {
        $lds = new LoginDataSource();
        $lds->open();
        $memberId = $lds->getMemberIdBasedOnToken($token);
        $lds->close();

        $sql = "SELECT * FROM Members ";
        $result = $this->da->execSelect($sql);
        $logs = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $log = new Log();
                $log->setLogId($row['MemberId']);
                $log->setDescription($row['FullName']);
                $logs[] = $log;
            }
        }
        return $logs;
    }


}