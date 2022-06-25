<?php 

class DB {
    private $host;
    private $user;
    private $password;
    private $db;
    public $conn;

    public function __construct($host, $user, $password, $db)
    {
        $this->host = $host;
        $this->user = $user;
        $this->password = $password;
        $this->db = $db;
    }

    public function createConn() {
        $this->conn = new mysqli($this->host, $this->user, $this->password, $this->db);
    }

    public function getConn() {
        return $this->conn;
    }
}

?>