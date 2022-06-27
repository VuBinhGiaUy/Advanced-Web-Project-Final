<?php
include "include/head.php";
include "models/Movie.php";
include "function/db.php";

$offset = rand(0, 38);
$movies = new Movie($conn);
$movieArr = $movies->fetchMoviesSlider($offset);
?>
<div class="jumbotron-fluid front rounded-0 mt-5">
    <div class="row">
        <img class="front-image" src="https://images8.alphacoders.com/121/1218962.jpg" alt="">
    </div>

    <div class="row front-content">
        <div class="col-6 col-sm-3 offset-3 offset-sm-0 ">
            <img class="h-200 w-100" src="https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg" alt="">
        </div>

        <div class="w-100 d-sm-none d-block"></div>

        <div class="col-10 col-sm-9 offset-1 offset-sm-0 align-self-end">
            <div class="row">
                <h4 class="col title-card card-outline text-left text-uppercase">
                    Spider-man:No way home
                </h4>

                <div class="w-100 d-md-none d-block"></div>

                <h5 class="col col-md-2 mx-1 title-card card-outline text-center text-uppercase">
                    pg-13
                </h5>

                <h5 class="col col-md-2 mx-1 title-card card-outline text-center text-uppercase">
                    123min
                </h5>
            </div>
            <div class="row d-none d-md-block title-card">
            gallery
            </div>
        </div>
    </div>
</div>
<div class="container">
    <h3>Product Slider</h3>
    <br>
    <div class="row">
        <!-- <div class="col-1" style="z-index: 10;">
            <button class="prev" style="margin-top: 100%; border-radius: 7px;"><i class="fas fa-chevron-left prev-icon"></i></button>
        </div> -->
        <div class="col-12">
            <div class="row center-slide">
                <?php foreach ($movieArr as $movie) { ?>
                    <div class="container">
                        <div class="card mb-3 round-15" style="height: 65vh;">
                            <img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="">
                            <div class="card-body d-flex flex-column justify-content-between">
                                <h5 class="card-title"><?= $movie['title'] ?></h5>
                                <div class="card-text">
                                    <p class="card-text text-left"><i class="fa fa-star"></i> <?= $movie['rating_average'] ?></p>
                                    <p class="card-text text-left"><i class="fas fa-dollar-sign"></i> <?= $movie['price'] ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
        <!-- <div class="col-1" style="z-index: 10;">
            <button class="next" style="margin-top: 100%; border-radius: 7px;"><i class="fas fa-chevron-right next-icon vertical-center"></i></button>
        </div> -->
    </div>
</div>
<?php
include "include/footer.php";
?>