<?php
include 'include/head.php';
include "models/Movie.php";
include "function/db.php";

$movies = new Movie($conn);
$movieArr = $movies->fetchAllMovies();
?>

<div class="jumbotron front rounded-0">
    <div class="container">

    </div>
</div>

<div class="container">
    <div class="row">
        <aside class="col-3 bg-dark text-white">
            fliter
        </aside>
        <div class="col-9">
            <div class="row justify-content-between mx-3">
                <?php foreach ($movieArr as $movie) : ?>
                    <div class="col-4">
                        <div class="card mb-3 round-15">
                            <img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="">
                            <div class="card-body">
                                <h4 class="card-title"><?= $movie['title'] ?></h4>
                                <p class="card-text"><?= $movie['rating_average'] ?></p>
                                <p class="card-text"><?= $movie['price'] ?></p>
                                <button type="button" name="" id="" class="btn btn-warning btn-md">Buy</button>
                            </div>
                            <button type="button" name="" id="" class="btn btn-primary btn-md btn-block mt-3">Add to Cart</button>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>
<?php
include 'include/footer.php'
?>