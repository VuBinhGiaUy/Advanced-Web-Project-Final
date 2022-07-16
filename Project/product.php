<?php
include 'include/head.php';
include "class/Movie.php";
include "class/Filter.php";

$page = 1;

$moviesObj = new Filter($conn);

if (isset($_GET['page']) && !empty($_GET['page'])) {
    $page = $_GET['page'];
}

if (isset($_GET['genre']) && !empty($_GET['genre'])) {
    
    $_GET['genre'] = array_unique($_GET['genre']);
    $moviesObj->setGenre($_GET['genre']);
} else {
    $moviesObj->setGenre();
}

if (isset($_GET['brand']) && !empty($_GET['brand'])) {
    
    $_GET['brand'] = array_unique($_GET['brand']);
    $moviesObj->setBrand($_GET['brand']);
} else {
    $moviesObj->setBrand();
}

if (isset($_GET['keyword']) && !empty($_GET['keyword'])) {
    $moviesObj->setKeyword($_GET['keyword']);
} else {
    $moviesObj->setKeyword();
}

$moviesObj->setCon();
$moviesObj->countFliteredMovies();
$moviesObj->setNumPage($page);
$movies = $moviesObj->fetchFliteredMovies();


$num_pages = $moviesObj->getTotalPages();
$cur_pages = $moviesObj->getCurrentPages();


$genres = $moviesObj->fetchAllGenre();
$brands = $moviesObj->fetchAllBrands();
?>

<!-- <div class="jumbotron front rounded-0" style="opacity: 0;">
    <div class="container">

    </div>
</div> -->


<div class="container mb-5 mt-5 pt-5">
    <div class="row">
        <aside class="col-3 text-dark filter-box">
            <form action="" method="GET">
                <div class="card-header">
                    <h3 class="filter-title">Filter</h3>
                    <textarea class="form-control ml-1 my-2" id="exampleFormControlTextarea1" rows="2" name="keyword" maxlength="50" style="resize: none; width: 96% ;"></textarea>
                    <button type="submit" class="btn-search">Search</button>
                </div>
                <div class="card-body dropdown">
                    <button type="button" onclick="GenreDrop()" class="dropbtn accordion">Genre</button>
                    <div id="myGenre" class="dropdown-content">
                        <?php foreach ($genres as $genre) : ?>
                            <div>
                                <input type="checkbox" name="genre[]" value="<?= $genre['genre_id'] ?> " <?php if (isset($_GET['genre']) && in_array($genre['genre_id'], $_GET['genre'])) echo "checked='checked'"; ?>>
                                <?= $genre['genre_name'] ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="card-body dropdown">
                    <button type="button" onclick="BrandDrop()" class="dropbtn accordion">Brand</button>
                    <div id="myBrand" class="dropdown-content">
                        <?php foreach ($brands as $brand) : ?>
                            <div>
                                <input type="checkbox" name="brand[]" value="<?= $brand['brand_id'] ?>" <?php if (isset($_GET['brand']) && in_array($brand['brand_id'], $_GET['brand'])) echo "checked='checked'"; ?>>
                                <?= $brand['brand_name'] ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </form>
        </aside>
        <div class="col-9">
            <div class="row mx-3 text-center">
                <?php
                foreach ($movies as $movie) { ?>
                    <div class="col col-sm-6 col-lg-4">
                        <div class="card mb-3 round-15 add-group-btn" style="height: 65vh;">
                            <a href="singleMovie.php?id=<?= $movie['movie_id']; ?>"><img class="card-img-top" src="<?= $movie['bluray_img'] ?>" alt="" style="height: 32vh;"></a>
                            <div class="card-body d-flex flex-column justify-content-between">
                                <a href="singleMovie.php?id=<?= $movie['movie_id']; ?>">
                                    <h5 class="card-title"><?= $movie['title'] ?></h5>
                                </a>
                                <div class="row">
                                    <div class="col-5">
                                        <p class="card-text text-left"><i class="fa fa-star" style="color: #ffc107;"></i> <?= $movie['rating_average'] ?></p>
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

                ?>
            </div>
            <div class="container pager">
                <div class="container d-flex mx-3">
                    <form action="" method="GET">

                        <div class="row flex-row">

                            <div class="page-item">
                                <button type="submit" class="btn btn-outline-primary mr-2 <?php if ($cur_pages == 1) {
                                                                                                echo "d-none";
                                                                                            } ?> " name="page" value="<?= $cur_pages - 1 ?>">Previous</button>
                                <div>
                                    <?php if (isset($_GET['genre']) && !empty($_GET['genre'])) :
                                        foreach ($_GET['genre'] as $genre) : ?>
                                            <input type="hidden" name="genre[]" value="<?= $genre ?>">
                                    <?php endforeach;
                                    endif; ?>
                                    <?php if (isset($_GET['brand']) && !empty($_GET['brand'])) :
                                        foreach ($_GET['brand'] as $brand) : ?>
                                            <input type="hidden" name="brand[]" value="<?= $brand ?>">
                                    <?php endforeach;
                                    endif; ?>
                                </div>
                            </div>


                            <?php
                            for ($i = 0; $i < $num_pages; $i++) :
                                $page_num = $i + 1;
                                $active = '';
                                if ($page_num == $cur_pages) {
                                    $active = 'active';
                                } ?>
                                <div class="page-item">
                                    <button type="submit" class="btn btn-outline-primary mr-2 <?= $active ?>" name="page" value="<?= $page_num ?>"><?= $page_num ?></button>
                                    <div>
                                        <?php if (isset($_GET['genre']) && !empty($_GET['genre'])) :
                                            foreach ($_GET['genre'] as $genre) : ?>
                                                <input type="hidden" name="genre[]" value="<?= $genre ?>">
                                        <?php endforeach;
                                        endif; ?>
                                        <?php if (isset($_GET['brand']) && !empty($_GET['brand'])) :
                                            foreach ($_GET['brand'] as $brand) : ?>
                                                <input type="hidden" name="brand[]" value="<?= $brand ?>">
                                        <?php endforeach;
                                        endif; ?>
                                    </div>
                                </div>

                            <?php endfor; ?>

                            <div class="page-item">
                                <button type="submit" class="btn btn-outline-primary mr-2 <?php if ($cur_pages == $num_pages) {
                                                                                                echo "d-none";
                                                                                            } ?>" name="page" value="<?= $cur_pages + 1 ?>">Next</button>
                                <div>
                                    <?php if (isset($_GET['genre']) && !empty($_GET['genre'])) :
                                        foreach ($_GET['genre'] as $genre) : ?>
                                            <input type="hidden" name="genre[]" value="<?= $genre ?>">
                                    <?php endforeach;
                                    endif; ?>
                                    <?php if (isset($_GET['brand']) && !empty($_GET['brand'])) :
                                        foreach ($_GET['brand'] as $brand) : ?>
                                            <input type="hidden" name="brand[]" value="<?= $brand ?>">
                                    <?php endforeach;
                                    endif; ?>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>



        </div>
    </div>

</div>
<?php
include 'include/footer.php'
?>