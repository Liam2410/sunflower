<?php
    require_once('App/Model/HomeModel.php');

    class HomeController extends BaseController{
        public function index(){
            $model = new HomeModel();

            $result = $model -> getCourseByLanguage('Tiếng Anh', 3);
            $englishCourse = $result["data"];
            /*
            for ($i=0; $i < sizeof($englishCourse); $i++) {
                $result = $model -> getTeacherOfCourseById($englishCourse[$i]['Id']);
                if (sizeof($result['data']) > 0){
                    $teacher = $result['data'][0];
                    print_r($teacher['Fullname']);
                    $englishCourse[$i] = array_merge($englishCourse[$i], array("teacher" => $teacher));
                }
                else{
                    $englishCourse[$i] = array_merge($englishCourse[$i], ["teacher" => null]);
                }
            }*/

            $result = $model -> getCourseByLanguage('Tiếng Trung', 3);
            $chineseCourse = $result["data"];

            $result = $model -> getCourseByLanguage('Tiếng Hàn', 3);
            $koreanCourse = $result["data"];

            $result = $model -> getCourseByLanguage('Tiếng Nhật', 3);
            $japaneseCourse = $result["data"];

            $result = $model -> getHottestNews(4);
            $newsArray = $result["data"];

            $result = $model -> getRandomNews(4);
            $recommendedNewsArray = $result["data"];

            if(isset($_SESSION["fullname"])){
                $this->renderView('Home.html', [
                    "fullname" => $_SESSION["fullname"], 
                    "englishCourse" => $englishCourse,
                    "chineseCourse" => $chineseCourse,
                    "koreanCourse" => $koreanCourse,
                    "japaneseCourse" => $japaneseCourse,
                    "newsArray" => $newsArray,
                    "recommendedNewsArray" => $recommendedNewsArray
                ]);
            }
            else{
                $this->renderView('Home.html', [
                    "englishCourse" => $englishCourse,
                    "chineseCourse" => $chineseCourse,
                    "koreanCourse" => $koreanCourse,
                    "japaneseCourse" => $japaneseCourse,
                    "newsArray" => $newsArray,
                    "recommendedNewsArray" => $recommendedNewsArray
                ]);
            }
        }
    }
?>