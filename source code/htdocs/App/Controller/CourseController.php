<?php
    require_once('App/Model/CourseModel.php');

    class CourseController extends BaseController{
        public function index(){
            $this->getCourses();
        }

        public function getCourses(){
            $model = new CourseModel();
            $result = $model -> getAllCourse();

            $courseArray = $result['data'];

            if(isset($_SESSION['fullname'])){
                $this->renderView("Courses.html", ['courseArray' => $courseArray, 'fullname' => $_SESSION['fullname']]);
            }
            else{
                $this->renderView("Courses.html", ['courseArray' => $courseArray]);
            }

        }

        public function searchCourse(){
            if(isset($_GET['course-name-input'])){
                if(isset($_GET['course-language'])){
                    $courseName = $_GET['course-name-input'];
                    $courseLanguage = $_GET['course-language'];
                    
                    $model = new CourseModel();
                    $result = $model -> searchCourseByNameAndLanguage($courseName, $courseLanguage);

                    $courseArray = $result['data'];

                    if(isset($_SESSION['fullname'])){
                        $this->renderView("Courses.html", ['courseArray' => $courseArray, 'fullname' => $_SESSION['fullname']]);
                    }
                    else{
                        $this->renderView("Courses.html", ['courseArray' => $courseArray]);
                    }
                }
                else{
                    $courseName = $_GET['course-name-input'];

                    $model = new CourseModel();
                    $result = $model -> searchCourseByName($courseName);

                    $courseArray = $result['data'];
                    
                    if(isset($_SESSION['fullname'])){
                        $this->renderView("Courses.html", ['courseArray' => $courseArray, 'fullname' => $_SESSION['fullname']]);
                    }
                    else{
                        $this->renderView("Courses.html", ['courseArray' => $courseArray]);
                    }
                }
            }
            else{
                header('Location: /course/getcourses');
            }
        }
        
        public function courseBooking(){
            if(isset($_SESSION['fullname'])){

                if(isset($_GET['id-course'])){

                    $idStudent = $_SESSION['id'];
                    $idCourse = $_GET['id-course'];

                    $model = new CourseModel();
                    $result = $model -> getStudentCourseByStudentId($idStudent);
                    $courseArray = $result['data'];
                    
                    $result = $model -> getStudentPendingByStudentId($idStudent);
                    $coursePendingArray = $result['data'];

                    /*
                    print_r(sizeof($courseArray));
                    echo('<div></div>');
                    */

                    $registerDate = date('Y-m-d');

                    for ($i=0; $i < sizeof($coursePendingArray); $i++) {
                        if($registerDate < $coursePendingArray[$i]['StartDateCourse']){
                            array_push($courseArray, $coursePendingArray[$i]);
                        }
                    }

                    /*
                    print_r($coursePendingArray);
                    echo('<div></div>');
                    print_r($courseArray);
                    exit();
                    */

                    $result = $model -> getCourseById($idCourse);
                    $courseBooking = $result['data'][0];
                    
                    if($registerDate > $courseBooking['StartDateCourse']){
                        $errorMessage = '<p>R???t ti???c <b>kh??a h???c n??y</b> ???? h???t h???n ????ng k??.</p>
                        <p>Vui l??ng ch???n ????ng k?? <b>c??c kh??a h???c th?? v??? kh??c</b> nh?? !</p>';
                        
                        $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                    }

                    else if(empty($courseArray)){
                        $status = 'Ch??a duy???t';
                        $model -> addStudentToPending($idStudent, $idCourse, $registerDate, $status);
                        $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'success' => TRUE]);
                    }
    
                    else{
                        $flag = TRUE;
                        for ($i=0; $i < sizeof($courseArray); $i++) { 
                            if ($courseArray[$i]['Id'] == $idCourse){
                                $errorMessage = '<p>B???n ???? ????ng k?? <b>kh??a h???c n??y</b></p>
                                <p>Vui l??ng ki???m tra l???i <b>l???ch h???c c???a b???n</b> ho???c ????ng k?? <b>c??c kh??a h???c th?? v??? kh??c</b> nh?? !</p>';
                                
                                $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                                $flag = FALSE;
                                break;
                            }
                            else if($courseArray[$i]['CourseSlot'] <= $courseArray[$i]['NumberStudentInCourse']){
                                $errorMessage = '<p>R???t ti???c <b>kh??a h???c n??y</b> ???? c?? ????? s??? l?????ng ng?????i ????ng k?? ho???c c?? th???i gian tr??ng v???i c??c kh??a h???c kh??c c???a b???n.</p>
                                <p>Vui l??ng ki???m tra l???i <b>l???ch h???c c???a b???n</b> ho???c ????ng k?? <b>c??c kh??a h???c th?? v??? kh??c</b> nh?? !</p>';
                                
                                $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                                $flag = FALSE;
                                break;
                            }
                            
                            else if ( ((($courseArray[$i]['StartDateCourse'] <= $courseBooking['EndDateCourse']) && ($courseArray[$i]['EndDateCourse'] >= $courseBooking['StartDateCourse']))
                            || (($courseArray[$i]['EndDateCourse'] >= $courseBooking['StartDateCourse']) && ($courseArray[$i]['StartDateCourse'] <= $courseBooking['EndDateCourse']))
                            ) && ($courseArray[$i]['CourseTime'] == $courseBooking['CourseTime']) ){
                                $errorMessage = '<p>R???t ti???c <b>kh??a h???c n??y</b> ???? c?? ????? s??? l?????ng ng?????i ????ng k?? ho???c c?? th???i gian tr??ng v???i c??c kh??a h???c kh??c c???a b???n.</p>
                                <p>Vui l??ng ki???m tra l???i <b>l???ch h???c c???a b???n</b> ho???c ????ng k?? <b>c??c kh??a h???c th?? v??? kh??c</b> nh?? !</p>';
                                
                                $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                                $flag = FALSE;
                                break;
                            }
                        }

                        if($flag){
                            $status = 'Ch??a duy???t';
                            $registerDate = date('Y-m-d');
                            $model -> addStudentToPending($idStudent, $idCourse, $registerDate, $status);
                            $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'success' => TRUE]);
                        }
                    }
                }
                else{
                    $errorMessage = '<p>B???n ch??a ch???n m???t kh??a h???c n??o ????? ????ng k??</p>
                    <p>H??y th??? ????ng k?? <b>m???t kh??a h???c th?? v??? b???t k?? n??o</b> ??i nh?? !</p>';
        
                    $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                }
            }

            else{
                $this->renderView('CourseBooking.html', []);
            }

        }


    }
?>