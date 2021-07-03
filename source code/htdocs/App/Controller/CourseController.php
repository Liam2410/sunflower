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
                        $errorMessage = '<p>Rất tiếc <b>khóa học này</b> đã hết hạn đăng ký.</p>
                        <p>Vui lòng chọn đăng kí <b>các khóa học thú vị khác</b> nhé !</p>';
                        
                        $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                    }

                    else if(empty($courseArray)){
                        $status = 'Chưa duyệt';
                        $model -> addStudentToPending($idStudent, $idCourse, $registerDate, $status);
                        $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'success' => TRUE]);
                    }
    
                    else{
                        $flag = TRUE;
                        for ($i=0; $i < sizeof($courseArray); $i++) { 
                            if ($courseArray[$i]['Id'] == $idCourse){
                                $errorMessage = '<p>Bạn đã đăng kí <b>khóa học này</b></p>
                                <p>Vui lòng kiểm tra lại <b>lịch học của bạn</b> hoặc đăng kí <b>các khóa học thú vị khác</b> nhé !</p>';
                                
                                $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                                $flag = FALSE;
                                break;
                            }
                            else if($courseArray[$i]['CourseSlot'] <= $courseArray[$i]['NumberStudentInCourse']){
                                $errorMessage = '<p>Rất tiếc <b>khóa học này</b> đã có đủ số lượng người đăng kí hoặc có thời gian trùng với các khóa học khác của bạn.</p>
                                <p>Vui lòng kiểm tra lại <b>lịch học của bạn</b> hoặc đăng kí <b>các khóa học thú vị khác</b> nhé !</p>';
                                
                                $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                                $flag = FALSE;
                                break;
                            }
                            
                            else if ( ((($courseArray[$i]['StartDateCourse'] <= $courseBooking['EndDateCourse']) && ($courseArray[$i]['EndDateCourse'] >= $courseBooking['StartDateCourse']))
                            || (($courseArray[$i]['EndDateCourse'] >= $courseBooking['StartDateCourse']) && ($courseArray[$i]['StartDateCourse'] <= $courseBooking['EndDateCourse']))
                            ) && ($courseArray[$i]['CourseTime'] == $courseBooking['CourseTime']) ){
                                $errorMessage = '<p>Rất tiếc <b>khóa học này</b> đã có đủ số lượng người đăng kí hoặc có thời gian trùng với các khóa học khác của bạn.</p>
                                <p>Vui lòng kiểm tra lại <b>lịch học của bạn</b> hoặc đăng kí <b>các khóa học thú vị khác</b> nhé !</p>';
                                
                                $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                                $flag = FALSE;
                                break;
                            }
                        }

                        if($flag){
                            $status = 'Chưa duyệt';
                            $registerDate = date('Y-m-d');
                            $model -> addStudentToPending($idStudent, $idCourse, $registerDate, $status);
                            $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'success' => TRUE]);
                        }
                    }
                }
                else{
                    $errorMessage = '<p>Bạn chưa chọn một khóa học nào để đăng kí</p>
                    <p>Hãy thử đăng kí <b>một khóa học thú vị bất kì nào</b> đi nhé !</p>';
        
                    $this->renderView('CourseBooking.html', ['fullname' => $_SESSION['fullname'], 'errorMessage' => $errorMessage]);
                }
            }

            else{
                $this->renderView('CourseBooking.html', []);
            }

        }


    }
?>