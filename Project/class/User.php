<?php 

class User {
    public $user_name;
    public $user_email;
    public $user_password;
    public $user_password_confirm;
    public $user_password_hash;
    public $user_role;
    public $conn;
    public $errors = [];
    public $user = [];
    public $users = [];

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function getUser($username) {
        
    } 

    public function checkUserExists() {

    }

    public function validateLogin($req) {

    }

    public function success() {

    }

    public function loginUser() {

    }

    public function createUser() {

    } 

    public function validateNewUser($user) {
        
    }
}

?>