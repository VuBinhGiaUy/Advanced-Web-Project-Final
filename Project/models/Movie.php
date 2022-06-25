<?php 
class Movie {
    protected $conn;
    public $movie = [];
    public $movies = [];

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function fetchMovie($id) {
        $sql = "SELECT movie.* FROM movie WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();

    }

    public function fetchMoives($offset = 0, $limit = 12) {
        $sql = "SELECT movie.* FROM movie LIMIT ?,?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ii", $offset, $limit);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getMovie() {
        return $this->movie;
    }

    public function getMovies() {
        return $this->movies;
    }

    // public function validateMovie($post) {
        
    // }

    // public function success() {
        
    // }

    // public function delete($id) {
        
    // }
}

?>