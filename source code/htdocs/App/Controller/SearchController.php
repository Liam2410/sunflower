<?php
    //require_once('App/Model/ScheduleModel.php');

    class SearchController extends BaseController{
        public function index(){
            if(isset($_SESSION["fullname"])){
                $fullname = $_SESSION["fullname"];

                $this->renderView('Search.html', ['fullname' => $fullname]);
            }
            else{
                $this->renderView('Search.html', []);
            }
        }

        public function handleSearchInput(){
            if(isset($_GET['search-input'])){
                if($_GET['search-category'] === 'Tin tức, bài viết, tài liệu'){
                    $headerString = 'Location: /news/searchnews?news-title-input='.$_GET['search-input'];
                    header($headerString);
                }
                elseif ($_GET['search-category'] !== 'Tin tức, bài viết, tài liệu' && $_GET['search-category'] !== '') {
                    $headerString = 'Location: /course/searchcourse?course-name-input='.$_GET['search-input'].'&course-language='.$_GET['search-category'];
                    header($headerString);
                }
            }
            else{
                $this->index();
            }
        }

    }
?>