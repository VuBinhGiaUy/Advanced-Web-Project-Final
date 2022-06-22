<?php
include "include/head.php";
?>
<div class="jumbotron front rounded-0">
    <div class="container">
        <h3>Banner</h3>
    </div>
</div>
<div class="container">
    <h3>Product Slider</h3>
    <br>
    <div class="carousel">
        <div class="slideshow-container">
            <!-- Loop here  -->
        </div>
        <div class="direction prev" tabindex="0" onclick="plusSlides(-1)" role="button">❮</div>
        <div class="direction next" tabindex="0" onclick="plusSlides(1)" role="button">❯</div>
    </div>
</div>
<script src="main.js"></script>
<?php
include "include/footer.php";
?>