<?php 
class Filter {
    protected $conn;
    public $brand = [];
    public $brands = [];

    public function __construct($conn) {
        $this->conn = $conn;
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

    public function fetchMovieBrand($id){
        $sql = "SELECT movie.* 
                FROM movie JOIN moviebrand ON movie.movie_id = moviebrand.movie_id 
                JOIN brand ON brand.brand_id = moviebrand.brand_id 
                WHERE brand.brand_id IN (?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}