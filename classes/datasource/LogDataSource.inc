<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Log.inc';

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


    public function getLogs($memberId)
    {
        $sql = "SELECT
`Logs`.LogId,
`Logs`.Member,
`Logs`.Object,
`Logs`.ObjectType,
`Logs`.Content,
`Logs`.Time,
`Logs`.Parent,
Members.MemberId,
Members.FullName,
Members.Phone,
Members.Email,
Members.`Password`
FROM `Logs` INNER JOIN Members On `Logs`.Member = Members.MemberId";


//        echo nl2br("\n$sql\n");
        $result = $this->da->execSelect($sql);
        $logs = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $log = new Log();
                $log->setLogId($row['LogId']);
                $log->setContent($row['Content']);
                $log->setTime($row['Time']);
                $log->setParent($row['Parent']);
                $member = new Member();
                $member->setMemberId($row['MemberId']);
                $member->setFullName($row['FullName']);
                $member->setPhone($row['Phone']);
                $member->setEmail($row['Email']);
                $log->setMember($member);
                $logs[] = $log;
            }
        }
        return $logs;
    }


}