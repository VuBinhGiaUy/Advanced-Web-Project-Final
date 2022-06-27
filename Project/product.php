<?php
include 'include/head.php';
include "models/Movie.php";
include "function/db.php";

$moviesObj = new Movie($conn);
$movies = $moviesObj->fetchAllMovies();

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
                    <h5>Brand</h5>
                    <?php foreach ($brandArr as $brand) : ?>
                        <div>
                            <input type="checkbox" name="brands[]" value="<?= $brand['brand_id'] ?>">
                            <?= $brand['brand_name'] ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            </form>
        </aside>
        <div class="col-9">
            <div class="row mx-3 text-center">
                <?php 
                    if(isset($_GET['brands'])){
                        $brandchecks = [];
                        $brandchecks = $_GET['brands'];
                        foreach($brandchecks as $checks){
                            
                        }
                    }
                ?>
                <?php foreach ($movies as $movie) : ?>
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
                <?php endforeach; ?>
            </div>
            <div class="container pager">
                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link previous" href="#" tabindex="-1">Previous</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link next" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</div>
<?php
include 'include/footer.php'
?>