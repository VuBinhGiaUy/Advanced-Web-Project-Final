<?php 
class Movie {
    protected $conn;
    public $movie = [];
    public $movies = [];
    public $brand = [];
    public $brands = [];

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function fetchMovie($id) {
        $sql = "SELECT movie.*, brand.brand_name
                FROM movie
                JOIN moviebrand ON movie.movie_id = moviebrand.movie_id
                JOIN brand ON brand.brand_id = moviebrand.brand_id
                WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getGenre($id) {
        $sql = "SELECT genre.genre_name
                FROM movie
                JOIN moviegenre ON movie.movie_id = moviegenre.movie_id
                JOIN genre ON genre.genre_id = moviegenre.genre_id
                WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function countGenre($id) {
        $sql = "SELECT COUNT(*)
                FROM movie
                JOIN moviegenre ON movie.movie_id = moviegenre.movie_id
                JOIN genre ON genre.genre_id = moviegenre.genre_id
                WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getMovieScreenshot($id) {
        $sql = "SELECT movieimage.img_url
                FROM movieimage
                JOIN movie ON movie.movie_id = movieimage.movie_id
                WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchMoviesSlider($offset, $limit = 12) {
        $sql = "SELECT movie.* FROM movie LIMIT ?,?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ii", $offset, $limit);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getMoviesRow() {
        $sql = "SELECT COUNT(*) FROM movie";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function fetchAllMovies() {
        $sql = "SELECT movie.* FROM movie";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // public function getMovie() {
    //     return $this->movie;
    // }

    // public function getMovies() {
    //     return $this->movies;
    // }

    // public function validateMovie($post) {
        
    // }

    // public function success() {
        
    // }

    // public function delete($id) {
        
    // }
}

?>