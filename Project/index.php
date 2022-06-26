<?php
include "include/head.php";
include "models/Movie.php";
include "function/db.php";

$movies = new Movie($conn);
$movieArr = $movies->fetchMoviesSlider();
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
    <div class="row center-slide">
        <?php foreach($movieArr as $movie) {?>
            <div class="container">
            <div class="card mb-3 round-15" style="height: 55vh;">
                    <img class="card-img-top" src="<?= $movie['bluray_img']?>" alt="">
                    <div class="card-body d-flex flex-column justify-content-around">
                        <h4 class="card-title"><?= $movie['title']?></h4>
                        <div>
                            <p class="card-text"><?= $movie['rating_average']?></p>
                            <p class="card-text"><?= $movie['price']?></p>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</div>
<?php
include "include/footer.php";
?>