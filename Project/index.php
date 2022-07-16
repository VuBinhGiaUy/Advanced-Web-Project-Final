<?php
include "include/head.php";
include "class/Movie.php";

$offset = rand(0, 38);
$bannerId = rand(1, 50);
$movies = new Movie($conn);
$movieArr = $movies->fetchMoviesSlider($offset);
$movieBanner = $movies->fetchMovie($bannerId);
?>
<div class="jumbotron-fluid front rounded-0 mt-5">

    <div class="row">
        <iframe class="banner-movie mt-4 my-1" src="<?= getYoutubeEmbedUrl($movieBanner['movie_trailer']); ?>?autoplay=1&mute=1&loop=1&rel=0&showinfo=0&controls=0" allow="accelerometer; modestbranding; encrypted-media; gyroscope" frameborder="0">
        </iframe>
    </div>
    <div class="row front-content mb-2 container">
        <div class="col-6 col-sm-3 offset-3 offset-sm-0 content-image">
            <a href="singleMovie.php?id=<?= $movieBanner['movie_id']?>"><img class="h-200 w-100" src="<?= $movieBanner['bluray_img'] ?>" alt=""></a>
        </div>

        <div class="w-100 d-sm-none d-block"></div>

        <div class="col-10 col-sm-9 offset-1 offset-sm-0 align-self-end content-text">
            <div class="row">
                <h4 class="col title-card card-outline text-center text-md-left text-uppercase">
                    <?= $movieBanner['title'] ?>
                </h4>

                <div class="w-100 d-md-none d-block"></div>

                <h5 class="col col-md-2 mx-1 title-card card-outline text-center text-uppercase">
                    RATED: <?= $movieBanner['rated'] ?>
                </h5>

                <h5 class="col col-md-2 mx-1 title-card card-outline text-center text-uppercase">
                    DUR: <?= $movieBanner['duration'] ?>MIN
                </h5>
            </div>
        </div>
    </div>
</div>
<div class="container my-5">
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
                        <div class="card mb-3 round-15" style="height: 62vh;">
                            <a href="singleMovie.php?id=<?= $movie['movie_id']; ?>"><img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="" height="250px"></a>
                            <div class="card-body d-flex flex-column justify-content-between">
                                <a href="singleMovie.php?id=<?= $movie['movie_id']; ?>">
                                    <h5 class="card-title"><?= $movie['title'] ?></h5>
                                </a>
                                <div class="row">
                                    <div class="col-6 card-text" style="font-size: 15px;">
                                        <p class="card-text text-left"><i class="fa fa-star" style="color: #ffc107;"></i> <?= $movie['rating_average'] ?></p>
                                        <p class="card-text text-left"><i class="fas fa-dollar-sign"></i> <?= $movie['price'] ?></p>
                                    </div>
                                    <div class="col-6 text-center add-group-btn">
                                        <button type="button" name="" id="" class="add-btn mt-2 add-cart-btn" data-price="<?= $movie['price'] ?>" data-id="<?= $movie['movie_id'] ?>" data-title="<?= $movie['title'] ?>"><i class="fas fa-shopping-cart"></i></button>
                                    </div>
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