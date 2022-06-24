<?php

class Router {
    public static $route;
    public static $url;
    public static $found = false;
    public static $validRoute = [];
    public static $params;

    public static function get($route, $function) {
        self::$route = $route;
        self::$validRoute[] = self::$route; 
        if(!isset($_GET['url'])) {
            self::$url = '';
        } else {
            self::$url = $_GET['url'];
        }

        self::getParams();

        if(self::$route == self::$url && $_SERVER['REQUEST_METHOD'] == "GET") {
            self::$found = true;
            $function->__invoke(self::$params);
        }

    }

    public static function post($route, $function) {
        self::$route = $route;
        self::$validRoute[] = self::$route; 
        if(!isset($_GET['url'])) {
            self::$url = '';
        } else {
            self::$url = $_GET['url'];
        }
        if(self::$route == self::$url && $_SERVER['REQUEST_METHOD'] == "POST") {
            self::$found = true;
            $function->__invoke(self::$params);
        }
    }

    public static function getParams() {
        if(strpos(self::$route, "{") !== false) {
            $routeArr = explode("/", self::$route);
            $urlArr = explode("/", self::$url);
            self::$params = end($urlArr);
            array_pop($routeArr);
            array_push($routeArr, self::$params);
            self::$route = join("/", $routeArr);
            self::$url = join("/", $urlArr);
         }
    }
    
    public static function redirect($dest) {
        // header("Location: " . ROOT . $dest);
    }

}

?>