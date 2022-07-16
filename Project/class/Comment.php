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


    public function fetchComments($id) {
       $sql = "SELECT review.* FROM review WHERE review.movie_id = ?";
       $stmt = $this->conn->prepare($sql);
       $stmt->bind_param("s", $id);
       $stmt->execute();
       $result = $stmt->get_result();
       return $result->fetch_all(MYSQLI_ASSOC);
    }


    public function insertComment($id,$like,$dislike,$content,$rating){
        $sql = "INSERT INTO review VALUES (?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("iiisi",$id,$like,$dislike,$content,$rating);
        $stmt->execute();
    }
}

?>