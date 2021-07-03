<?php
    require_once('App/Model/NewsModel.php');

    class NewsController extends BaseController{
        public function index(){
            $this->renderView('AddNews.html', []);
        }

        public function getNews(){
            $model = new NewsModel();

            $result = $model -> getAllNews();
            $newsArray = $result['data'];

            $result = $model -> getRandomNews(4);
            $recommendedNewsArray = $result['data'];

            if(isset($_SESSION['fullname'])){
                $this->renderView('News.html', ['newsArray' => $newsArray, 'recommendedNewsArray' => $recommendedNewsArray, 'fullname' => $_SESSION['fullname']]);
            }
            else{
                $this->renderView('News.html', ['newsArray' => $newsArray, 'recommendedNewsArray' => $recommendedNewsArray]);
            }
        }

        public function getNewsDetail(){
            if(isset($_GET['id-news'])){
                $model = new NewsModel();
                $result = $model -> getNewsById($_GET['id-news']);

                $news = $result['data'][0];

                $newCategory = $news['NewsCategory'];
                $result = $model -> getNewsByCategory(4, $newCategory);
                $newsArray = $result['data'];

                if(isset($_SESSION['fullname'])){
                    $this->renderView('NewsDetail.html', ['news' => $news, 'newsArray' => $newsArray, 'fullname' => $_SESSION['fullname']]);
                }
                else{
                    $this->renderView('NewsDetail.html', ['news' => $news, 'newsArray' => $newsArray]);
                }

            }
            else{
                header('Location: /home/index');
            }
        }

        public function searchNews(){
            if(isset($_GET['news-title-input'])){
                $newsTitle = $_GET['news-title-input'];

                $model = new NewsModel();
                $result = $model -> getNewsByNewsTitle($newsTitle);

                $newsArray = $result['data'];

                if(isset($_SESSION['fullname'])){
                    $this->renderView('News.html', ['newsArray' => $newsArray, 'fullname' => $_SESSION['fullname']]);
                }
                else{
                    $this->renderView('News.html', ['newsArray' => $newsArray]);
                }

            }
            else{
                header('Location: /news/getnews');
            }
        }

    }
?>