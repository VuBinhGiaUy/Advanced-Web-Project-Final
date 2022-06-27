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
        $sql = "SELECT movie.* FROM movie WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
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

    public function fetchBrand($id){
        $sql = "SELECT brand.* FROM brand WHERE brand.brand_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc(); 
    }

    public function fetchAllBrands() {
        $sql = "SELECT brand.* FROM brand";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchAllGenre(){
        $sql = "SELECT genre.* FROM genre";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchMovieGenre($id){
        $sql = "SELECT movie.* 
                FROM movie JOIN moviegenre ON movie.movie_id = moviegenre.movie_id 
                JOIN genre ON genre.genre_id = moviegenre.genre_id 
                WHERE genre.genre_id IN (?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $id);
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