<?php 

class Review {
    public $review = [];
    public $reviews = [];
    public $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }


    public function fetchReviews($movie_id) {
        $sql = "SELECT review.*, users.username
                FROM review
                JOIN movie ON movie.movie_id = review.movie_id
                JOIN users ON users.user_id = review.user_id
                WHERE movie.movie_id = $movie_id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->get_result();
        return $results->fetch_all(MYSQLI_ASSOC);
    }

    public function postReviews($new_review, $movie_id, $user_id) {
        $review = [
            "content" => $new_review['review_content'],
            "rating" => $new_review['review_rating']
        ];
        $sql = "INSERT INTO review (review.review_content, review.rating, movie_id, user_id) VALUES (?, ?, ?, ?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ssii", $review['content'], $review['rating'], $movie_id, $user_id);
        $stmt->execute();
    }
}

?>