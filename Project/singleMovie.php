<?php
include "include/head.php";
include "models/Movie.php";
include "function/db.php";

$id = 5;
$moviesObj = new Movie($conn);
$movie = $moviesObj->fetchMovie($id);
$genres = $moviesObj->getGenre($id);
$genresCount = $moviesObj->countGenre($id);
$movieScreenshots = $moviesObj->getMovieScreenshot($id);
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
        <div class="col-12 pb-4">
            <div class="row">
                <div class="col-6">
                    <button type="button" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn"><i class="fas fa-play"></i> View trailer</button>
                </div>
                <div class="col-6">
                    <button type="button" class="btn btn-primary btn-md btn-block mt-3 add-cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
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
            <p><span style="font-weight: bold;">Director: </span></p>
            <p><span style="font-weight: bold;">Starring: </span></p>
            <p><span style="font-weight: bold;">Producer: </span></p>
        </div>
        <div class="col-12 pb-4">
            <h4>Comments:</h4>
            <div class="row">
                <div class="col-1">
                    <h6>GiaUy</h6>
                    <img src="https://scontent.fsgn5-13.fna.fbcdn.net/v/t1.6435-9/41645101_678801425826197_7582335169869119488_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=ad2b24&_nc_ohc=5yONXkFlWOMAX8sIsqr&tn=jUMdiGebBXrKgA7g&_nc_ht=scontent.fsgn5-13.fna&oh=00_AT-Q9g1K4-xMmfTW5U7ZYpTzhMg1ZVfyynVgWsekU50taw&oe=62E13F24" alt="" class="rounded-circle" width="50px" height="50px">
                </div>
                <div class="col-11 py-2" style="border-radius: 15px; background: beige;">
                    <div class="d-flex pb-1">
                        <p class="mt-2"><i class="fas fa-star"></i> 9/10</p>
                        <div class="ml-auto">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-thumbs-up"></i></button>
                        <button class="btn btn-danger" type="submit"><i class="fas fa-thumbs-down"></i></button>
                        </div>
                    </div>
                    <p>Sequels are tough. When I first saw this, I didn't think it quite lived up to the first but on rewatch that's flipped a bit. 
                        It's still a flawless Reynolds performance but now he has a solid supporting cast around him, 
                        a story that has some meat on it and, surprisingly some growth for the Merc with the Mouth. 
                        Still flawed, but so much fun. Also, much love for Domino and Cable here.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
include "include/footer.php";
?>