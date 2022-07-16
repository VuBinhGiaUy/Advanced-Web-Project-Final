<?php
include "include/head.php";
include "class/Movie.php";
include "class/Review.php";

$moviesObj = new Movie($conn);
$reviewObj = new Review($conn);

if (isset($_GET['id'])) {
    $movie = $moviesObj->fetchMovie($_GET['id']);
    $genres = $moviesObj->getGenre($_GET['id']);
    $genresCount = $moviesObj->countGenre($_GET['id']);
    $movieScreenshots = $moviesObj->getMovieScreenshot($_GET['id']);
    $reviews = $reviewObj->fetchReviews($_GET['id']);
}

?>
<div class="container mt-5 px-5" style="background: aliceblue;">
    <div class="row">
        <div class="col-12 pt-5 pb-4">
            <h2><?php echo $movie['title']; ?></h2>
        </div>
        <div class="col-6 text-center pb-5">
            <img src="<?php echo $movie['bluray_img']; ?>" alt="">
        </div>
        <div class="col-6 text-left pb-5">
            <p><span style="font-weight: bold;">Brand: </span><?php echo $movie['brand_name']; ?></p>
            <p><span style="font-weight: bold;">Release: </span><?php echo $movie['release_date']; ?></p>
            <p><span style="font-weight: bold;">Duration: </span><?php echo $movie['duration']; ?> mins</p>
            <p><span style="font-weight: bold;">Rated: </span><?php echo $movie['rated']; ?></p>
            <p><span style="font-weight: bold;">Price: </span>$<?php echo $movie['price']; ?></p>
            <p class="card-text text-left"><span style="font-weight: bold;">Rating: </span><?= $movie['rating_average'] ?> <i class="fa fa-star" style="color: #ffc107;"></i></p>
            <p><span style="font-weight: bold;">Genre: </span>
                <?php
                $str = "";
                foreach ($genres as $genre) {
                    if ($str) {
                        $str .= ", ";
                    }
                    $str .= $genre['genre_name'];
                }
                echo $str;
                ?>
            </p>
        </div>
        <div class="col-12 movie-trailer d-none">
            <iframe class="banner-movie" src="<?= getYoutubeEmbedUrl($movie['movie_trailer']); ?>" allow="accelerometer; modestbranding; encrypted-media; gyroscope" frameborder="0">
            </iframe>
        </div>
        <div class="col-12 pb-4">
            <div class="row">
                <div class="col-6">
                    <button type="button" class="btn btn-primary btn-md btn-block mt-3  trailer-btn"><i class="fas fa-play"></i> View trailer</button>
                </div>
                <div class="col-6 add-group-btn">
                    <button type="button" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn" data-price="<?= $movie['price'] ?>" data-id="<?= $movie['movie_id'] ?>" data-title="<?= $movie['title'] ?>"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                </div>
            </div>
        </div>
        <div class="col-12 pb-4">
            <h4>Overview:</h4>
            <h6><?php echo $movie['title'] . "(" . $movie['release_date'] . ")"; ?></h6>
            <div class="row pb-4">
                <?php foreach ($movieScreenshots as $screenshot) { ?>
                    <div class="col-3">
                        <img src="<?php echo $screenshot['img_url']; ?>" alt="" width="200px">
                    </div>
                <?php } ?>
            </div>
            <p><?php echo $movie['overview']; ?></p>
        </div>
        <div class="col-12 pb-4">
            <h4>Reviews:</h4>
            <?php if ($_SESSION['logged_in'] == true) : ?>
                <?php foreach ($reviews as $review) { ?>
                    <div class="row py-1">
                        <div class="col-2 text-center">
                            <h6 class="py-2"><?= $review['username']; ?></h6>
                            <img src="asset/logo.png" alt="" width="75px" height="75px">
                        </div>
                        <div class="col-10 py-2" style="border-radius: 15px; background: beige;">
                            <div class="d-flex pb-1">
                                <p class="mt-2"><i class="fas fa-star" style="color: #ffc107;"></i> <?= $review['rating']; ?>/10</p>
                                <div class="ml-auto">
                                    <button class="btn btn-primary" type="submit"><i class="fas fa-thumbs-up"></i> <?= $review['review_like']; ?></button>
                                    <button class="btn btn-danger" type="submit"><i class="fas fa-thumbs-down"></i> <?= $review['review_dislike']; ?></button>
                                </div>
                            </div>
                            <p><?= $review['review_content']; ?></p>
                        </div>
                    </div>
                <?php } ?>
                <div class="col-12 py-3">
                    <div class="form-group row">
                        <div class="col-7">
                            <label for="exampleFormControlTextarea1">Review Content</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                        <div class="col-5">
                            <span class="star-rating">
                                <!--RADIO 1-->
                                <input type='checkbox' class="radio_item" value="1" name="item" id="radio1">
                                <label class="label_item" for="radio1"> &#9734 </label>
                                <!--RADIO 2-->
                                <input type='checkbox' class="radio_item" value="2" name="item2" id="radio2">
                                <label class="label_item" for="radio2"> &#9734 </label>
                                <!--RADIO 3-->
                                <input type='checkbox' class="radio_item" value="3" name="item3" id="radio3">
                                <label class="label_item" for="radio3"> &#9734 </label>
                                <!--RADIO 4-->
                                <input type='checkbox' class="radio_item" value="4" name="item4" id="radio4">
                                <label class="label_item" for="radio4"> &#9734 </label>
                                <!--RADIO 5-->
                                <input type='checkbox' class="radio_item" value="5" name="item5" id="radio5">
                                <label class="label_item" for="radio5"> &#9734 </label>
                                <!--RADIO 6-->
                                <input type='checkbox' class="radio_item" value="6" name="item6" id="radio6">
                                <label class="label_item" for="radio6"> &#9734 </label>
                                <!--RADIO 7-->
                                <input type='checkbox' class="radio_item" value="7" name="item7" id="radio7">
                                <label class="label_item" for="radio7"> &#9734 </label>
                                <!--RADIO 8-->
                                <input type='checkbox' class="radio_item" value="8" name="item8" id="radio8">
                                <label class="label_item" for="radio8"> &#9734 </label>
                                <!--RADIO 9-->
                                <input type='checkbox' class="radio_item" value="9" name="item9" id="radio9">
                                <label class="label_item" for="radio9"> &#9734 </label>
                                <!--RADIO 10-->
                                <input type='checkbox' class="radio_item" value="10" name="item10" id="radio10">
                                <label class="label_item" for="radio10"> &#9734 </label>
                            </span>
                        </div>
                    </div>
                    <div class="border-0"><button type="button" name="" id="" class="btn btn-success btn-md btn-block">Review</button></div>
                </div>
            <?php else : ?>
                <a href="login.php">
                    <div class="border-0"><button type="button" name="" id="" class="btn btn-warning btn-md btn-block">Log In to view and write Review</button></div>
                </a>
            <?php endif; ?>
        </div>
    </div>
</div>
<?php
include "include/footer.php";
?>