<?php
include "function/init.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="rating.css">

    <title>Blu-ray Shop</title>
</head>

<body class="">
    <nav class="navbar navbar-expand-lg fixed-top navbar-light">
        <div class="container">
            <div class="logo">
                <img src="asset/logo.png" alt="">
                <a class="navbar-brand" href="index.php" style="font-size: 25px; font-weight: bold;">AWP Blu-ray</a>
            </div>
            <button class="navbar-toggler" data-target="#my-nav" data-toggle="collapse" aria-controls="my-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="my-nav" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.php" style="font-size: 20px;">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <a class="nav-link" href="product.php?page=1" style="font-size: 20px;">Product<span class="sr-only">(current)</span></a>
                    <?php if ($_SESSION['logged_in'] == true) : ?>
                        </li>
                        <a class="nav-link" href="userinfo.php" style="font-size: 20px;"><i class="fa fa-user-circle" aria-hidden="true"></i> <?= $_SESSION['username']; ?><span class="sr-only">(current)</span></a>
                        </li>
                        </li>
                        <a class="nav-link" href="logout.php" style="font-size: 20px;">Logout<span class="sr-only">(current)</span></a>
                        </li>
                    <?php else : ?>
                        </li>
                        <a class="nav-link" href="login.php" style="font-size: 20px;"><i class="fa fa-user" aria-hidden="true"></i> Login<span class="sr-only">(current)</span></a>
                        </li>
                    <?php endif; ?>
                    <?php $curPageName = substr($_SERVER["SCRIPT_NAME"], strrpos($_SERVER["SCRIPT_NAME"], "/") + 1);
                    if ($curPageName != "login.php") : ?>
                        <li class="cart-btn">
                            <button type="button" class="btn btn-warning transparent" style="font-size: 20px;">
                                <i class="fa-solid fa-cart-shopping"></i> Cart <span class="badge badge-light">0</span>
                            </button>
                        </li>

                        <li class="cart-wrapper">
                            <div class="cart">
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
                                            <td colspan="4">Total: $<span class="total"></span></td>
                                            <?php if ($_SESSION['logged_in'] == true) : ?>
                                                <td class="border-0"><button type="button" onclick="window.location.href='checkout.php'" name="" id="" class="btn btn-success btn-md btn-block">Check Out</button></td>
                                            <?php else : ?>
                                                <td class="border-0"><a href="login.php"><button type="button" name="" id="" class="btn btn-warning btn-md btn-block">Log In to Check Out</button></a></td>
                                            <?php endif; ?>
                                        </tr>

                                    </tfoot>
                                </table>
                            </div>
                        </li>
                    <?php endif; ?>
                    <li>
                        <a href="javascript:void(0);" class="icon" onclick="navFunction()">
                            <i class="fa fa-bars"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>