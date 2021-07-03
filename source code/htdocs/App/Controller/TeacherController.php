<?php
    require_once('App/Model/TeacherModel.php');

    class TeacherController extends BaseController{

        public function index(){
            $this->renderView('HomeTeacher.html', []);
        }

        public function uploadImage($targetDir, $nameInput){
            $targetFile = $targetDir . time() . basename($_FILES[$nameInput]['name']);
            $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

            if ($imageFileType != "jpg" && $imageFileType != "jpeg" && $imageFileType != "png"){
                return "";
            }
            move_uploaded_file($_FILES[$nameInput]["tmp_name"], $targetFile);
            return $targetFile;
        }

        //GET addClass
        public function addClass(){
            $this->renderView('AddClass.html', []);
        }

        //POST addClass
        public function addClassPost(){
            if(isset($_SESSION['id'])){
                if( isset($_POST['course-name']) && isset($_POST['course-description']) 
                && isset($_POST['start-date-course']) && isset($_POST['end-date-course']) && isset($_POST['course-time'])
                && isset($_POST['course-language']) && isset($_POST['course-price']) && isset($_POST['course-slot'])){

                    $idTeacher = $_SESSION['id'];
                    $registerDate = date('Y-m-d');
                    $courseName = $_POST['course-name'];

                    $targetDir = "App/View/Source/Image/Course/";
                    $nameInput = "course-image";
                    $nameFile = $this->uploadImage($targetDir, $nameInput);

                    if($nameFile === ''){
                        $targetFile = '/' . 'App/View/Source/Image/Course/' . 'course-image-default.jpg';
                    }
                    else{
                        $targetFile = '/' . $nameFile;
                    }

                    $courseDescription = $_POST['course-description'];
                    $startDateCourse = $_POST['start-date-course'];
                    $endDateCourse = $_POST['end-date-course'];
                    $courseTime = $_POST['course-time'];
                    $courseLanguage = $_POST['course-language'];
                    $coursePrice = $_POST['course-price'];
                    $courseSlot = $_POST['course-slot'];

                    $model = new TeacherModel();
                    $result = $model -> getAllCourse();
                    $courseArray = $result['data'];

                    $result = $model -> getAllPendingCourse();
                    $pendingCourseArray = $result['data'];

                    for ($i=0; $i < sizeof($pendingCourseArray); $i++) {
                        array_push($courseArray, $pendingCourseArray[$i]);
                    }

                    $flag = TRUE;
                    for ($i=0; $i < sizeof($courseArray); $i++) {
                        if ( ((($courseArray[$i]['StartDateCourse'] <= $endDateCourse) && ($courseArray[$i]['EndDateCourse'] >= $startDateCourse))
                            || (($courseArray[$i]['EndDateCourse'] >= $startDateCourse) && ($courseArray[$i]['StartDateCourse'] <= $endDateCourse))
                            ) && ($courseArray[$i]['CourseTime'] == $courseTime) ){
                            $errorMessage = '<strong>Khônh thể đăng ký mở lớp!</strong> Khoá học này có thời gian bị trùng với khóa học khác của bạn';
                            
                            $this->renderView('AddClass.html', ['errorMessage' => $errorMessage]);
                            $flag = FALSE;
                            break;
                        }
                    }

                    if($flag){
                        $model = new TeacherModel();
                        $result = $model->addPendingCourse($idTeacher, $registerDate, $courseName, $targetFile, $courseDescription, $startDateCourse, $endDateCourse, $courseTime, $courseLanguage, $coursePrice, $courseSlot); 
                        
                        $successMessage = '<strong>Đăng kí mở khóa học thành công!</strong> Vui lòng đợi admin xét duyệt';


                        $this->renderView('AddClass.html', ['successMessage' => $successMessage]);
                    }

                    
                }
                else{
                    $this->renderView('AddClass.html', []);
                }
            }
            else{
                header('Location: /account/login');
            }
        }

        public function getTeacherSchedule(){

            if(isset($_SESSION['username'])){
                $username = $_SESSION['username'];
                $model = new TeacherModel();
                $result = $model -> getTeacherCourseByUsername($username);
                $teacherCourseArray = $result['data'];
                
                $this->renderView('TeacherSchedule.html', ["teacherCoureArray" => $teacherCourseArray]);
            }
            else{
                $this->renderView('TeacherSchedule.html', []);
            }
        }

        public function getTeacherInfor(){
            $model = new TeacherModel();
            $result = $model->getById($_SESSION['id']);

            $teacher = $result['data'][0];

            $this->renderView('TeacherInfor.html', ["teacher" => $teacher]);
        }
        //GET editInforTeacher
        public function editInfoTeacher(){
            $model = new TeacherModel();
            $result = $model->getById($_SESSION['id']);

            $teacher = $result['data'][0];

            $this->renderView('EditInfoTeacher.html', ["teacher" => $teacher]);
        }

        //POST editInforTeacher
        public function editInfoTeacherPost(){
            if(isset($_POST['fullname'])){
                $username = $_POST['username'];
                $fullname = $_POST['fullname'];
                $email = $_POST['email'];
                $language = $_POST['language'];
                $phone = $_POST['phone'];
                $degree = $_POST['degree'];

                if(isset($_FILES['avatar-image'])){
                    if( $_FILES['avatar-image']['name'] ){
                        $targetDir = "App/View/Source/Image/Teacher/";
                        $nameInput = "avatar-image";
                        $avatarURL = '/' . $this->uploadImage($targetDir, $nameInput);
                    }
                    else{
                        $avatarURL = '';
                    }
                }
                else{
                    $avatarURL = '';
                }
                $model = new TeacherModel();
                $result = $model -> updateTeacherInformationByUsername($username, $email, $fullname, $language, $phone, $avatarURL, $degree);

                $_SESSION["username"] = $username;
                $_SESSION["fullname"] = $fullname;
                $_SESSION["email"] = $email;
            }
            $this->editInfoTeacher();
        }

        public function getTeacherCourse(){
            $model = new TeacherModel();
            $result = $model->getTeacherCourseByUsername($_SESSION['username']);

            $teacherCourseArray = $result['data'];

            $this->renderView('CreatedClass.html', ["teacherCourseArray" => $teacherCourseArray]);
        }

        public function logout(){
            session_start();
            session_destroy();

            header('Location: /home/index');
        }

    }
?>