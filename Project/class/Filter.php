<?php
class Filter extends Movie
{
    protected $conn;
    public $genres = [];
    public $brands = [];

    public $sqlCon = "";
    public $sqlType = "";
    public $sqlParam = [];

    public function __construct($conn)
    {
        parent::__construct($conn);
    }

    public function fetchAllBrands()
    {
        $sql = "SELECT brand.* FROM brand";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchAllGenre()
    {
        $sql = "SELECT genre.* FROM genre";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchMovieGenre($id)
    {
        $sql = "SELECT movie.*, genre.genre_name
                FROM movie JOIN moviegenre ON movie.movie_id = moviegenre.movie_id 
                JOIN genre ON genre.genre_id = moviegenre.genre_id 
                WHERE genre.genre_id IN (?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchMovieBrand($id)
    {
        $sql = "SELECT movie.*, brand.brand_name 
                FROM movie JOIN moviebrand ON movie.movie_id = moviebrand.movie_id 
                JOIN brand ON brand.brand_id = moviebrand.brand_id 
                WHERE brand.brand_id IN (?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // set genres
    public function setGenre($genreArr = []){
        $this->genres = $genreArr;
    }

    // set brands
    public function setBrand($brandArr = []){
        $this->brands = $brandArr;
    }

    // set both sqlCon and sqlParam
    public function setCon()
    {
        if (!empty($this->genres)) {
            $this->sqlCon = $this->sqlCon . " AND ";
            $this->sqlCon = $this->sqlCon .  "genre.genre_id IN (";
            $lastKey = count($this->genres) - 1;
            foreach ($this->genres as $key => $genre) {
                $this->sqlCon =  $this->sqlCon . "?";
                $this->sqlType =  $this->sqlType . "s";
                array_push($this->sqlParam, $genre);
                if ($key === $lastKey) {
                    $this->sqlCon =  $this->sqlCon . ")";
                } else {
                    $this->sqlCon =  $this->sqlCon . ",";
                }
            }
        }
        if (!empty($this->brands)) {
            $this->sqlCon = $this->sqlCon .  " AND ";
            $this->sqlCon =  $this->sqlCon . "brand.brand_id IN (";
            $lastKey = count($this->brands) - 1;
            foreach ($this->brands as $key => $brand) {
                $this->sqlCon =  $this->sqlCon . "?";
                $this->sqlType =  $this->sqlType . "s";
                array_push($this->sqlParam, $brand);
                if ($key === $lastKey) {
                    $this->sqlCon =  $this->sqlCon . ")";
                } else {
                    $this->sqlCon =  $this->sqlCon . ",";
                }
            }
        }
    }

    public function fetchFliteredMovies()
    {
        $pageParam = $this->sqlParam;
        array_push($pageParam, $this->offset);
        array_push($pageParam, $this->limit);
        $sql = "SELECT movie.*, genre.genre_name, brand.brand_name
                FROM movie JOIN moviegenre ON movie.movie_id = moviegenre.movie_id 
                JOIN genre ON genre.genre_id = moviegenre.genre_id 
                JOIN moviebrand ON movie.movie_id = moviebrand.movie_id 
                JOIN brand
                WHERE brand.brand_id = moviebrand.brand_id" . $this->sqlCon." GROUP BY (movie.movie_id) LIMIT ?,?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param($this->sqlType . "ii", ...$pageParam);
        $stmt->execute();
        $result = $stmt->get_result();
        $result->fetch_all(MYSQLI_ASSOC);
        return $result;
    }

    public function countFliteredMovies()
    {
        $pageParam = $this->sqlParam;
        $sql = "SELECT COUNT(DISTINCT movie.movie_id) AS num_movies 
                FROM movie JOIN moviegenre ON movie.movie_id = moviegenre.movie_id 
                JOIN genre ON genre.genre_id = moviegenre.genre_id 
                JOIN moviebrand ON movie.movie_id = moviebrand.movie_id 
                JOIN brand
                WHERE brand.brand_id = moviebrand.brand_id" . $this->sqlCon;
        $stmt = $this->conn->prepare($sql);
        if(!empty($pageParam)){
            $stmt->bind_param($this->sqlType, ...$pageParam);
        }
        
        $stmt->execute();
        $result = $stmt->get_result();
        $result = $result->fetch_assoc();
        $this->num_movies = $result['num_movies'];
    }
}
