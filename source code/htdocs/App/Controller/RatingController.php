<?php
    require_once('App/Model/RatingModel.php');

    class RatingController extends BaseController{

        public function getTeachers(){
            if(isset($_SESSION['fullname'])){

                $model = new RatingModel();

                $result = $model->getAllTeacher();
                $teacherArray = $result['data'];
    
                $this->renderView('Teachers.html', ['teacherArray' => $teacherArray, 'fullname' => $_SESSION['fullname']]);
            }
            else{
                $this->renderView('Teachers.html', []);
            }
        }

        public function teacherRating(){
            if(isset($_SESSION['id'])){
                if($_GET['id-teacher']){
                    $model = new RatingModel();

                    $result = $model->getTeacherById($_GET['id-teacher']);
                    $teacher = $result['data'][0];

                    
                    $result = $model -> getTeacherInforById($_GET['id-teacher']);
                    $teacherInfor = $result['data'][0];

                    $result = $model->getStudentAndTeacher($_SESSION['id'], $_GET['id-teacher']);
                    $studentTeacher = $result['data'];

                    $result = $model-> getCommentRatingByIdTeacher($_GET['id-teacher']);
                    $commentAndRatingArray = $result['data'];

                    $result = $model -> getRatingCountById($_GET['id-teacher']);
                    $ratingCountArray = $result['data'];

                    $ratingCount = array(
                        "TotalRating" => 0,
                        "FivePoint" => 0,
                        "FourPoint" => 0,
                        "ThreePoint" => 0,
                        "TwoPoint" => 0,
                        "OnePoint" => 0
                    );

                    foreach ($ratingCountArray as $rating) {
                        if($rating['RatingPoint'] == 5){
                            $ratingCount['FivePoint'] = $rating['NumberRating'];
                            $ratingCount['TotalRating'] += $rating['NumberRating'];
                        }
                        elseif($rating['RatingPoint'] == 4){
                            $ratingCount['FourPoint'] = $rating['NumberRating'];
                            $ratingCount['TotalRating'] += $rating['NumberRating'];
                        }
                        elseif($rating['RatingPoint'] == 3){
                            $ratingCount['ThreePoint'] = $rating['NumberRating'];
                            $ratingCount['TotalRating'] += $rating['NumberRating'];
                        }
                        elseif($rating['RatingPoint'] == 2){
                            $ratingCount['TwoPoint'] = $rating['NumberRating'];
                            $ratingCount['TotalRating'] += $rating['NumberRating'];
                        }
                        else{
                            $ratingCount['OnePoint'] = $rating['NumberRating'];
                            $ratingCount['TotalRating'] += $rating['NumberRating'];
                        }
                    }

                    $this->renderView('TeacherRating.html', ['teacher' => $teacher, 'teacherInfor' => $teacherInfor, 'studentTeacher' => $studentTeacher, 'commentAndRatingArray' => $commentAndRatingArray, 'fullname' => $_SESSION['fullname'], 'ratingCount' => $ratingCount]);
                }
            }
            else{
                $this->renderView('TeacherRating.html', []);
            }
        }

        public function teacherRatingPost(){
            if(isset($_SESSION['id']) && isset($_POST['comment-content'])){
                $idStudent = $_SESSION['id'];
                $idTeacher = $_POST['id-teacher'];
                $ratingPoint = $_POST['rating-point'];
                $commentContent = $_POST['comment-content'];
                $commentDate = date('Y/m/d');

                $model = new RatingModel();
                $model -> addNewComment($idStudent, $idTeacher, $ratingPoint, $commentContent, $commentDate);
                
                $headerString = 'Location: /rating/TeacherRating?id-teacher='.$idTeacher;
                header($headerString);
            }
            else{
                $this->renderView('TeacherRating.html', []);
            }
        }
    }
?>