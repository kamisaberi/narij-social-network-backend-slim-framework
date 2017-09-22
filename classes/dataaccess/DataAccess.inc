<?php

/**
 * Created by PhpStorm.
 * User: kami
 * Date: 1/17/2017
 * Time: 11:40 PM
 */
class DataAccess
{
    public $connection;

    public function open()
    {
        $this->connection = mysqli_connect("127.0.0.1", "root", "", "NARIJ_00005");
    }

    public function exec($sql)
    {
        mysqli_query($this->connection, $sql);
        return mysqli_insert_id($this->connection);
    }

    public function execSelect($sql)
    {
        //echo $sql;
        return mysqli_query($this->connection, $sql);
    }

    public function close()
    {
        mysqli_close($this->connection);
    }
}