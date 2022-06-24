<?php 

class Movie {
    public $conn;

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function fetchPost($id) {
        
    }

    public function fetchPosts($offset = 0, $limit = 12) {
        
    }

    public function getPost() {
        return $this->post;
    }

    public function getPosts() {
        return $this->posts;
    }

    public function validatePost($post) {
        
    }

    public function createNewPost() {
        
    }

    public function success() {
        
    }

    public function delete($id) {
        
    }
}

?>