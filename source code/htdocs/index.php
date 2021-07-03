<?php
    require_once('App/Base/BaseController.php');
    require_once('App/Controller/HomeController.php');
    require_once('App/Controller/AccountController.php');
    require_once('App/Controller/ErrorController.php');
    require_once('App/Controller/NewsController.php');
    require_once('App/Controller/CourseController.php');
    require_once('App/Controller/AdminController.php');
    require_once('App/Controller/ScheduleController.php');
    require_once('App/Controller/TeacherController.php');
    require_once('App/Controller/SearchController.php');
    require_once('App/Controller/RatingController.php');
    require_once('vendor/autoload.php');
    
    if(isset($_GET['controller'])){
        $controller = $_GET['controller'];

        if(isset($_GET['action'])){
            $action = $_GET['action'];
        }
        else{
            $action = 'index';
        }
    }
    else{
        $controller = 'Home';
        $action = 'index';
    }

    $controllerClassName = ucfirst($controller) . 'Controller';
    if(!class_exists($controllerClassName)){
        $controller = 'ErrorController';
        $action = 'notFoundError';
    }
    else{
        $controller = $controllerClassName;
    }

    $obj = new $controller();
    if(!method_exists($obj, $action)){
        $obj = new ErrorController();
        $action = 'notFoundError';
    }

    session_start();

    $studentPermission = ["AccountController", "CourseController",
        "HomeController", "NewsController", "ScheduleController", "SearchController", "RatingController"];

    $adminPermission = ["HomeController" => ["all"], "CourseController" => ["getcourses", "searchcourse"],
     "AdminController" => ["all"], "NewsController" => ["all"], "AccountController" => ['login', 'logout'],
     "SearchController" => ["all"]];

    $teacherPermission = ["TeacherController" => ["all"], "AccountController" => ['login', 'logout', 'detail', 'save', 'changepassword', 'changePasswordPost'],
     "HomeController" => ["all"], "NewsController" => ["all"], "CourseController" => ["getcourses", "searchcourse"],
     "SearchController" => ["all"]];

    if(isset($_SESSION['role'])){
        if($_SESSION['role'] == "Admin"){
            if(array_key_exists($controller, $adminPermission) && ( (in_array($action, $adminPermission[$controller])) || $adminPermission[$controller][0] == "all") ){
                $obj -> $action();
            }
            else{
                $error = new ErrorController();
                $error -> forbiddenError();
            }
        }
        if($_SESSION['role'] == "Student"){
            if(in_array($controller, $studentPermission)){
                $obj -> $action();
            }
            else{
                $error = new ErrorController();
                $error -> forbiddenError();
            }
        }
        if($_SESSION['role'] == "Teacher"){
            if(array_key_exists($controller, $teacherPermission) && ( (in_array($action, $teacherPermission[$controller])) || $teacherPermission[$controller][0] == "all") ){
                $obj -> $action();
            }
            else{
                $error = new ErrorController();
                $error -> forbiddenError();
            }
        }
    }
    else{
        if(in_array($controller, $studentPermission)){
            $obj -> $action();
        }
        else{
            $error = new ErrorController();
            $error -> forbiddenError();
        }
    }
    
?>