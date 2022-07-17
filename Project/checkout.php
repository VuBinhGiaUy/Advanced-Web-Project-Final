<?php
include "include/head.php";
?>

<div class="container py-5 text-center mt-5">
    <!-- <div class="mt-5">
        <img src="https://media4.giphy.com/media/LY7RTbrtVfuT01MenI/giphy.gif?cid=790b76110d0ee96e69a34b11c9fe2ec9306482ea662af42e&rid=giphy.gif&ct=s" width="250" height="250">
        <h1>Features under development</h1>
    </div> -->
    <div class="checkout">
        <h3 class="font-weight-light"><i class="fa-solid fa-cart-shopping mr-2"></i>Your Cart</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Price</th>
                    <th scope="col">Count</th>
                </tr>
            </thead>
            <tbody style="height:60vh; display: block; overflow-y: scroll;">

            </tbody>
            <tfoot>
                <tr class="row justify-content-between">
                    <td colspan="4"><h3>Total: $<span class="total"></span></h3></td>
                </tr>

            </tfoot>
        </table>
    </div>
</div>

<?php
include "include/footer.php";
?>