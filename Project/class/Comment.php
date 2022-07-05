<?php 

class Comment {
    public $comment = [];
    public $comments = [];
    public $comment_text;
    public $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }


    public function fetchComments($post_id) {
       
    }

    public function getComments() {
        
    }
}

?>