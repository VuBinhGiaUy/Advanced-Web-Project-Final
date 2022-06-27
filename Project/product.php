<?php
include 'include/head.php';
include "models/Movie.php";
include "function/db.php";

$moviesObj = new Movie($conn);
$movies = $moviesObj->fetchAllMovies();

$genresObj = new Movie($conn);
$genres = $genresObj->fetchAllGenre();
$brandsObj = new Movie($conn);
$brands = $brandsObj->fetchAllBrands();
?>

<div class="jumbotron front rounded-0">
    <div class="container">

    </div>
</div>

<div class="container">
    <div class="row">
        <aside class="col-3 bg-dark text-white">
            <form action="" method="GET">
                <div class="card-header">
                    <h3>Filter</h3>
                    <button type="submit" class="btn btn-primary btn-sm float-end">Search</button>
                </div>
                <div class="card-body">
                    <h5>Genre</h5>
                    <?php foreach ($genres as $genre) : ?>
                        <div>
                            <input type="checkbox" name="genre[]" value="<?= $genre['genre_id'] ?>">
                            <?= $genre['genre_name'] ?>
                        </div>
                    <?php endforeach; ?>
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
                                <div class="card mb-3 round-15 add-group-btn" style="height: 70vh;">
                                    <img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <h4 class="card-title"><?= $movie['title'] ?></h4>
                                        <div>
                                            <p class="card-text text-left"><i class="fa fa-star"></i> <?= $movie['rating_average'] ?></p>
                                            <p class="card-text text-left"><i class="fas fa-dollar-sign"></i> <?= $movie['price'] ?></p>
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
                            <div class="card mb-3 round-15 add-group-btn" style="height: 70vh;">
                                <img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="" style="height: 32vh;">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <h4 class="card-title"><?= $movie['title'] ?></h4>
                                    <div>
                                        <p class="card-text text-left"><i class="fa fa-star"></i> <?= $movie['rating_average'] ?></p>
                                        <p class="card-text text-left"><i class="fas fa-dollar-sign"></i> <?= $movie['price'] ?></p>
                                    </div>
                                </div>
                                <button type="button" name="" id="" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn" data-price="<?= $movie['price'] ?>" data-id="<?= $movie['movie_id'] ?>" data-title="<?= $movie['title'] ?>"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                            </div>
                        </div>
                <?php }
                }
                ?>
            </div>
        </div>
    </div>

</div>
<?php
include 'include/footer.php'
?>