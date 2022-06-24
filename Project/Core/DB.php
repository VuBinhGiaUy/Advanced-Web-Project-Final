<?php 

class DB {
    private static $conn;
    private static $ins = null;

    private function __construct() {

    }

    public static function createInstance() {
        if(is_null(self::$ins)) {
            self::$ins = new DB;
        }
        return self::$ins;
    }

    public static function connect($host, $user, $pw, $db) {
        self::$conn = new mysqli($host, $user, $pw, $db);
    }

    public static function getConn() {
        return self::$conn;
    }
}

?>