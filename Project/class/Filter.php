<?php
class Filter
{
    protected $conn;
    public $genres = [];
    public $brands = [];

    public $sqlCon = "";
    public $sqlType = "";
    public $sqlParam = [];

    public function __construct($conn)
    {
        $this->conn = $conn;
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

    public function fetchGenreAndBrand($genreid, $brandid)
    {
        $sql = "SELECT movie.*, genre.genre_name, brand.brand_name
                FROM movie JOIN moviegenre ON movie.movie_id = moviegenre.movie_id 
                JOIN genre ON genre.genre_id = moviegenre.genre_id 
                JOIN moviebrand ON movie.movie_id = moviebrand.movie_id 
                JOIN brand ON brand.brand_id = moviebrand.brand_id 
                WHERE (genre.genre_id IN (?)) OR (brand.brand_id IN (?))
                GROUP BY movie.title";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ss", $genreid, $brandid);
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
            $this->sqlCon = " AND ";
            $this->sqlCon =  "genre.genre IN (";
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
            $this->sqlCon = " AND ";
            $this->sqlCon =  "brand.brand_id IN (";
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

    public function fetchFliteredMovie()
    {
        $this->setCon();
        $sql = "SELECT movie.*, genre.genre_name, brand.brand_name
                FROM movie JOIN moviegenre ON movie.movie_id = moviegenre.movie_id 
                JOIN genre ON genre.genre_id = moviegenre.genre_id 
                JOIN moviebrand ON movie.movie_id = moviebrand.movie_id 
                JOIN brand
                WHERE brand.brand_id = moviebrand.brand_id" . $this->sqlCon;
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param($this->sqlType, ...$this->sqlParam);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
