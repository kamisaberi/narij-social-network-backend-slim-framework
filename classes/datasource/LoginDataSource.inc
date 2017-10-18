<?php

require_once __DIR__ . '/../dataaccess/DataAccess.inc';
require_once __DIR__ . '/../model/Login.inc';

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 8/25/2017
 * Time: 5:29 AM
 */
class LoginDataSource
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


    public function getMemberIdBasedOnToken($token)
    {
        $sql = "SELECT Member FROM Logins WHERE Logins.Token='$token' ORDER BY Logins.LoginId DESC LIMIT 1";
//        echo $sql;
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                return $row["Member"];
            }
        } else {
            return 0;
        }
    }

    public function authenticate($token, $ip)
    {
        $sql = "SELECT * FROM Logins WHERE Logins.Token='$token' ORDER BY LoginId DESC  LIMIT 1";
        $result = $this->da->execSelect($sql);
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $lastIP = $row["IP"];
                if ($lastIP == $ip) {
                    return "SUCCESS";
                } else {
                    return "IP CHANGED";
                }
            }
        } else {
            return "INVALID";
        }
    }


    public function createLog(Login $login)
    {
        $sql = "INSERT INTO Logins (Description, Token, Member, IP) VALUES ('{$login->getDescription()}','{$login->getToken()}','{$login->getMemberId()}','{$login->getIP()}')";

        $this->da->exec($sql);
        return true;
    }


}