<?php
include "include/head.php";
include "class/Movie.php";
include "class/Review.php";
include "function/loginHandler.php";

$moviesObj = new Movie($conn);
$reviewObj = new Review($conn);
$reviewNew = new Review($conn);

if (isset($_REQUEST['review_content']) && !empty($_REQUEST['review_content'])){
    $user = getUser($_SESSION['username']);
    $user_id = $user['user_id'];
    $review = [
        "review_content" => htmlspecialchars($_REQUEST['review_content']),
        "review_rating" => $_REQUEST['review_rating'] * 2
    ];
    $reviewNew->postReviews($review, $_GET['id'], $user_id);
    $_REQUEST['review_content'] = null;

}

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
        <div class="col col-md-6 text-center pb-5">
            <img src="<?php echo $movie['bluray_img']; ?>" alt="">
        </div>
        <div class="col col-md-6 text-left pb-5">
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
                <div class="col col-md-6">
                    <button type="button" class="btn btn-primary btn-md btn-block mt-3  trailer-btn"><i class="fas fa-play"></i> View trailer</button>
                </div>
                <div class="col col-md-6 add-group-btn">
                    <button type="button" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn" data-price="<?= $movie['price'] ?>" data-id="<?= $movie['movie_id'] ?>" data-title="<?= $movie['title'] ?>"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                </div>
            </div>
        </div>
        <div class="col-12 pb-4">
            <h4>Overview:</h4>
            <h6><?php echo $movie['title'] . "(" . $movie['release_date'] . ")"; ?></h6>
            <div class="d-flex flex-wrap justify-content-around">
                <?php foreach ($movieScreenshots as $screenshot) { ?>
                        <img src="<?php echo $screenshot['img_url'];?>" class="mx-1 my-1" alt="" width="200px">
                <?php } ?>
            </div>
            <p><?php echo $movie['overview']; ?></p>
        </div>
        <div class="col-12 pb-4">
            <h4>Reviews:</h4>
            <?php if ($_SESSION['logged_in'] == true) : ?>

                <?php foreach ($reviews as $review) { ?>
                    <div class="row py-1">
                        <div class="col-2 d-none d-lg-block text-center">
                            <h6 class="py-2"><?= $review['username']; ?></h6>
                            <img src="asset/logo.png" alt="" width="75px" height="75px">
                        </div>
                        <div class="col col-lg-10 py-2" style="border-radius: 15px; background: beige;">
                            <div class="d-flex pb-1">

                                <div class="mt-2 mr-5 font-weight-bold"><?= $review['username']; ?></div>

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
                <form action="" method="POST" >
                    <div class="col-12 py-3">
                        <div class="form-group row">
                            <div class="col col-md-5">
                                <label for="exampleFormControlTextarea1">Review Content</label>
                            </div>

                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" name="review_content"></textarea>

                            <div class="col col-md-1 mt-4">
                                Rating
                            </div>
                            <div class="col col-md-6 mt-3">
                                <span class="star-rating">
                                    <label class="rating-label">
                                        <input class="rating" max="5" oninput="this.style.setProperty('--value', `${this.valueAsNumber}`)" step="0.5" style="--stars:5;--value:1;" type="range" value="5" name="review_rating">
                                    </label>
                                </span>
                            </div>
                        </div>
                        <div class="border-0"><button type="submit" name="username" id="" class="btn btn-success btn-md btn-block" value="<?= $_SESSION['username'] ?>">Review</button></div>
                    </div>
                </form>
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