<?php
class Movie
{
    protected $conn;
    public $movie = [];
    public $movies = [];
    public $brand = [];
    public $brands = [];
    public $offset;
    public $limit;
    public $num_movies;
    public $all_pages;
    public $cur_pages;

    public function __construct($conn)
    {
        $this->conn = $conn;
        $this->countMovies();
    }

    // count the number of movies to calc pages
    public function countMovies()
    {
        $sql = "SELECT COUNT(movie_id) AS num_movies 
                    FROM movie";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        $result = $result->fetch_assoc();
        $this->num_movies = $result['num_movies'];
    }

    public function fetchMovie($id)
    {
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

    public function calcPager()
    {
        $this->all_pages = ceil($this->num_movies / $this->limit);
    }

    public function setNumPage($page)
    {
        $this->limit = 12;
        $this->offset = ($page - 1) * $this->limit;
        $this->cur_pages = $page;
        $this->calcPager();
    }

    public function getTotalPages()
    {
        return $this->all_pages;
    }

    public function getCurrentPages()
    {
        return $this->cur_pages;
    }

    public function fetchMovies()
    {
        $sql = "SELECT movie.* FROM movie
                LIMIT ?,?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ii", $this->offset, $this->limit);
        $stmt->execute();
        $results = $stmt->get_result();

        return $results->fetch_all(MYSQLI_ASSOC);
    }

    public function getGenre($id)
    {
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

    public function countGenre($id)
    {
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

    public function getMovieScreenshot($id)
    {
        $sql = "SELECT movieimage.img_url
                FROM movieimage
                JOIN movie ON movie.movie_id = movieimage.movie_id
                WHERE movie.movie_id = $id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function fetchMoviesSlider($offset, $limit = 12)
    {
        $sql = "SELECT movie.* FROM movie LIMIT ?,?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ii", $offset, $limit);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getMoviesRow()
    {
        $sql = "SELECT COUNT(*) FROM movie";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function fetchAllMovies()
    {
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

function getYoutubeEmbedUrl($url)
{
    $shortUrlRegex = '/youtu.be\/([a-zA-Z0-9_-]+)\??/i';
    $longUrlRegex = '/youtube.com\/((?:embed)|(?:watch))((?:\?v\=)|(?:\/))([a-zA-Z0-9_-]+)/i';

    if (preg_match($longUrlRegex, $url, $matches)) {
        $youtube_id = $matches[count($matches) - 1];
    }

    if (preg_match($shortUrlRegex, $url, $matches)) {
        $youtube_id = $matches[count($matches) - 1];
    }
    return 'https://www.youtube.com/embed/' . $youtube_id;
}
