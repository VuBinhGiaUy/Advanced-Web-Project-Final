<?php

session_start();
if(!isset($_SESSION['logged_in'])) {
    $_SESSION['logged_in'] = false;
}

function classLoader($className) {
    include "classes/" . $className . ".php";
}

spl_autoload_register('classLoader');

$db = new DB("localhost", "root", "", "moviedb");
$conn = $db->createConn();

$message = [];

?>