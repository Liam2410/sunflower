<?php
    require_once('App/Model/ScheduleModel.php');

    class ScheduleController extends BaseController{
        public function index(){
            if(isset($_SESSION["fullname"])){

                $studentId = $_SESSION["id"];
                $studentFullname = $_SESSION["fullname"];

                $model = new ScheduleModel();
                $result = $model -> getStudentCourseById($studentId);
                $studentCourseArray = $result['data'];
                /*
                $result = $model -> getPendingStudentCourseById($studentId);
                $pendingStudentCourseArray = $result['data'];
                
                $registerDate = date('Y-m-d');

                for ($i=0; $i < sizeof($pendingStudentCourseArray); $i++) {
                    if($registerDate < $pendingStudentCourseArray[$i]['StartDateCourse']){
                        array_push($studentCourseArray, $pendingStudentCourseArray[$i]);
                    }
                }*/

                $this->renderView('Schedule.html', ['fullname' => $studentFullname, "studentCourseArray" => $studentCourseArray]);
            }
            else{
                $this->renderView('Schedule.html', []);
            }
        }
    }
?>