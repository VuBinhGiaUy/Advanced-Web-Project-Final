<?php
include 'include/head.php';
include "models/Movie.php";
include "function/db.php";
include "function/filter.php";

$moviesObj = new Movie($conn);
$movies = $moviesObj->fetchAllMovies();

$genresObj = new Filter($conn);
$genres = $genresObj->fetchAllGenre();
$brandsObj = new Filter($conn);
$brands = $brandsObj->fetchAllBrands();
?>

<div class="jumbotron front rounded-0" style="opacity: 0;">
    <div class="container">

    </div>
</div>

<div class="container">
    <div class="row">
        <aside class="col-3 text-dark filter-box">
            <form action="" method="GET">
                <div class="card-header">
                    <h3 class="filter-title">Filter</h3>
                    <button type="submit" class="btn-search">Search</button>
                </div>
                <div class="card-body dropdown">
                    <button type="button" onclick="myFunction()" class="dropbtn">Genre</button>
                    <div id="myGenre" class="dropdown-content">
                        <?php foreach ($genres as $genre) : ?>
                            <div>
                                <input type="checkbox" name="genre[]" value="<?= $genre['genre_id'] ?>">
                                <?= $genre['genre_name'] ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </form>
        </aside>
        <div class="col-9">
            <div class="row mx-3 text-center">
                <?php
                if (isset($_GET['genre'])) {
                    $genrechecks = [];
                    $genrechecks = $_GET['genre'];
                    foreach ($genrechecks as $checks) {
                        // echo gettype($checks);
                        $genred = $genresObj->fetchMovieGenre($checks);
                        // echo gettype($genred);
                        foreach ($genred as $movie) { ?>
                            <div class="col col-sm-6 col-lg-4">
                                <div class="card mb-3 round-15 add-group-btn" style="height: 65vh;">
                                    <img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="" style="height: 32vh;">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <h5 class="card-title"><?= $movie['title'] ?></h5>
                                        <div class="row">
                                            <div class="col-5">
                                                <p class="card-text text-left"><i class="fa fa-star"></i> <?= $movie['rating_average'] ?></p>
                                                <p class="card-text text-left"><i class="fas fa-dollar-sign"></i> <?= $movie['price'] ?></p>
                                            </div>
                                            <div class="col-7">
                                                <p class="card-text text-left"><i class="fas fa-clock"></i> <?= $movie['duration'] ?> mins</p>
                                                <p class="card-text text-left"><i class="fas fa-calendar-alt"></i> <?= $movie['release_date'] ?></p>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" name="" id="" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn" data-price="<?= $movie['price'] ?>" data-id="<?= $movie['movie_id'] ?>" data-title="<?= $movie['title'] ?>"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                                </div>
                            </div>
                        <?php }
                    }
                } else {
                    foreach ($movies as $movie) { ?>
                        <div class="col col-sm-6 col-lg-4">
                            <div class="card mb-3 round-15 add-group-btn" style="height: 65vh;">
                                <a href="singleMovie.php"><img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="" style="height: 32vh;"></a>
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <h5 class="card-title"><?= $movie['title'] ?></h5>
                                    <div class="row">
                                        <div class="col-5">
                                            <p class="card-text text-left"><i class="fa fa-star"></i> <?= $movie['rating_average'] ?></p>
                                            <p class="card-text text-left"><i class="fas fa-dollar-sign"></i> <?= $movie['price'] ?></p>
                                        </div>
                                        <div class="col-7">
                                            <p class="card-text text-left"><i class="fas fa-clock"></i> <?= $movie['duration'] ?> mins</p>
                                            <p class="card-text text-left"><i class="fas fa-calendar-alt"></i> <?= $movie['release_date'] ?></p>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" name="" id="" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn" data-price="<?= $movie['price'] ?>" data-id="<?= $movie['movie_id'] ?>" data-title="<?= $movie['title'] ?>"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                            </div>
                        </div>
                <?php }
                }
                ?>
            </div>
            <div class="container pager">

            </div>
        </div>
    </div>

</div>
<?php
include 'include/footer.php'
?>