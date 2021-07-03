<?php
    require_once('App/Model/AdminModel.php');

    class AdminController extends BaseController{

        public function index(){

            $model = new AdminModel();
            $resultCourseArray = $model -> getAllCourse();
            $resultTeacherArray = $model -> getAllTeacher();
            $resultStudentArray = $model -> getAllStudent();
            $resultNewsArray = $model -> getAllNews();

            $courseNumber = count($resultCourseArray['data']);
            $teacherNumber = count($resultTeacherArray['data']);
            $studentNumber = count($resultStudentArray['data']);
            $newsNumber = count($resultNewsArray['data']);

            $this->renderView('Home.html', ['courseNumber' => $courseNumber, 'teacherNumber' => $teacherNumber,
                                            'studentNumber' => $studentNumber, 'newsNumber' => $newsNumber]);
        }
        //GET getTeacherDetail
        public function getTeacherDetail(){
            if(isset($_GET['username'])){
                $username = $_GET['username'];

                $model = new AdminModel();
                $result = $model -> getTeacherByUsername($username);
                $teacherDetail = $result['data'][0];

                $result = $model -> getTeacherCourseByUsername($username);
                $teacherCourseArray = $result['data'];

                $idTeacher = $teacherDetail['Id'];
                $result = $model -> getTeacherCommentRatingById($idTeacher);
                $commentAndRatingArray = $result['data'];
                
                $this->renderView('TeacherDetail.html', ["teacher" => $teacherDetail, "teacherCoureArray" => $teacherCourseArray, "commentAndRatingArray" => $commentAndRatingArray]);
            }
            else{
                $this->renderView('TeacherDetail.html', []);
            }
        }

        public function deleteCommentRating(){
            if(isset($_GET['id-comment-rating']) && isset($_GET['username'])){
                $model = new AdminModel();
                $result = $model -> deleteCommentRatingById($_GET['id-comment-rating']);

                $headerLocation = 'Location: /admin/getTeacherDetail?username='.$_GET['username'];
                header($headerLocation);
            }
            else{
                $this->getTeachers();
            }
        }

        //POST updateTeacherInfor
        public function updateTeacherInfor(){
            if(isset($_POST['username'])){

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
                $model = new AdminModel();
                $result = $model -> updateTeacherInformationByUsername($username, $email, $fullname, $language, $phone, $avatarURL, $degree);

                $headerLocation = 'Location: /admin/getteacherdetail?username='.$username;
                header($headerLocation);
            }
            else{
                $this->getTeachers();
            }
        }
        //GET searchTeacher
        public function searchTeacher(){
            if(isset($_GET['teacher-name'])){
                $teacherName = $_GET['teacher-name'];

                if(isset($_GET['teacher-language']) && $_GET['teacher-language'] !== 'All'){
                    $teacherLanguage = $_GET['teacher-language'];
    
                    $model = new AdminModel();
                    $result = $model -> searchTeacherByNameAndLang($teacherName, $teacherLanguage);
                }
                else{
                    $model = new AdminModel();
                    $result = $model -> searchTeacherByName($teacherName);
                }
                
                $this->renderView('TeacherSearch.html', ["teacherArray" => $result['data']]);
            }
            else{
                $this->renderView('TeacherSearch.html', []);
            }
        }

        public function getTeachers(){
            $model = new AdminModel();
            $result = $model -> getAllTeacher();

            $this->renderView('TeacherList.html', ["teacherArray" => $result['data']]);
        }

        public function deleteTeacher(){
            if(isset($_GET['username']) && isset($_GET['teacherId'])){
                $model = new AdminModel();

                $resultDeleteTeacher = $model -> deleteTeacherByUsername($_GET['username']);
                $resultDeleteTeacherInStudentCourse = $model -> deleteTeacherInCourseById($_GET['teacherId']);

                $this->getTeachers();
            }
            else{
                $this->getStudents();
            }
        }

        public function addNewTeacher(){
            if( isset($_POST['username']) ){
                $username = $_POST['username'];
                $password = $_POST['password'];
                $fullname = $_POST['fullname'];
                $email = $_POST['email'];
                $language = $_POST['language'];
                $phone = $_POST['phone'];
                $dateOfBirth = $_POST['date-of-birth'];
                $degree = $_POST['degree'];
                $avatarURL = '';

                $hashedPassword = md5($password);

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

                $model = new AdminModel();
                $result = $model -> addTeacherToAccount($username, $hashedPassword, $fullname, $email, $avatarURL, $dateOfBirth);
                
                $result = $model -> addTeacherToAccountTeacher($username, $language, $degree, $phone, 5.0);

                $this->renderView('AddTeacher.html', []);
            }
            else{
                $this->renderView('AddTeacher.html', []);
            }
        }

        //GET getStudentDetail
        public function getStudentDetail(){
            if(isset($_GET['studentId'])){
                $id = $_GET['studentId'];

                $model = new AdminModel();
                $result = $model -> getStudentById($id);
                $studentDetail = $result['data'][0];

                $result = $model -> getStudentCourseById($id);
                $studentCourseArray = $result['data'];

                $this->renderView('StudentDetail.html', ["student" => $studentDetail, "studentCourseArray" => $studentCourseArray]);
            }
            else{
                $this->renderView('StudentDetail.html', []);
            }
        }

        //GET searchStudent
        public function searchStudent(){
            if(isset($_GET['student-name'])){
                $model = new AdminModel();
                $result = $model -> searchStudentByName($_GET['student-name']);
                $studentArray = $result['data'];

                $this->renderView('StudentSearch.html', ['studentArray' => $studentArray]);
            }
            else{
                $this->renderView('StudentSearch.html', []);
            }
        }

        public function getStudents(){
            $model = new AdminModel();
            $result = $model -> getAllStudent();

            $this->renderView('StudentList.html', ["studentArray" => $result['data']]);
        }

        public function deleteStudent(){
            if(isset($_GET['studentId'])){
                $model = new AdminModel();

                $resultDeleteStudent = $model -> deleteStudentById($_GET['studentId']);
                $resultDeleteStudentInSC = $model -> deleteStudentInCourseById($_GET['studentId']);
                $resultDeleteStudentInCR = $model -> deleteStudentInCommentRating($_GET['studentId']);
                $resultDeleteStudentInPendingSC = $model -> deleteStudentInPendingStudentCourse($_GET['studentId']);

                $this->getStudents();
            }
            else{
                $this->getStudents();
            }
        }

        //GET addNews
        public function addNews(){
            $this->renderView('AddNews.html', []);
        }

        public function uploadImage($targetDir, $nameInput){
            $targetFile = $targetDir . time() . basename($_FILES[$nameInput]['name']);
            $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

            if ($imageFileType != "jpg" && $imageFileType != "jpeg" && $imageFileType != "png"){
                echo "File không đúng định dạnh cho phép";
                return "";
            }
            move_uploaded_file($_FILES[$nameInput]["tmp_name"], $targetFile);
            return $targetFile;
        }

        //POST addNewsPost
        public function addNewsPost(){
            if( isset($_POST['news-content']) && isset($_FILES['news-image']) && isset($_POST['news-description']) 
                && isset($_POST['news-category'])
            ){
                $newsTitle = $_POST['news-title'];
                
                $targetDir = "App/View/Source/Image/News/";
                $nameInput = "news-image";
                $targetFile = '/' . $this->uploadImage($targetDir, $nameInput);

                $newsDescription = $_POST['news-description'];
                $newsContent = $_POST['news-content'];
                $newsReleaseDate = date('Y/m/d');
                $newsCategory = $_POST['news-category'];

                $model = new AdminModel();
                $result = $model -> addNews($newsTitle, $targetFile, $newsDescription, $newsContent, $newsReleaseDate, $newsCategory);
                //Thêm phần thông báo thành công         
            }
            $this->renderView('AddNews.html', []);
        }

        //GET addCourse
        public function addNewCourse(){
            $this->renderView('AddCourse.html', []);
        }
        //POST addCourse
        public function addNewCoursePost(){
            if( isset($_POST['course-name']) && isset($_FILES['course-image']) && isset($_POST['course-description']) 
            && isset($_POST['start-date-course']) && isset($_POST['end-date-course']) && isset($_POST['course-time'])
            && isset($_POST['course-language']) && isset($_POST['course-price']) && isset($_POST['course-slot'])){

                $courseName = $_POST['course-name'];

                $targetDir = "App/View/Source/Image/Course/";
                $nameInput = "course-image";
                $targetFile = '/' . $this->uploadImage($targetDir, $nameInput);

                $courseDescription = $_POST['course-description'];
                $startDateCourse = $_POST['start-date-course'];
                $endDateCourse = $_POST['end-date-course'];
                $courseTime = $_POST['course-time'];
                $courseLanguage = $_POST['course-language'];
                $coursePrice = $_POST['course-price'];
                $courseSlot = $_POST['course-slot'];

                $model = new AdminModel();
                $result = $model->addCourse($courseName, $targetFile, $courseDescription, $startDateCourse, $endDateCourse, $courseTime, $courseLanguage, $coursePrice, $courseSlot); 
                
                $this->renderView('AddCourse.html', []);
            }
            else{
                $this->renderView('AddCourse.html', []);
            }
        }

        public function getCourses(){
            $model = new AdminModel();
            $result = $model -> getAllCourse();

            $this->renderView('CourseList.html', ['courseArray' => $result['data']]);
        }

        public function getCourseDetail(){
            if(isset($_GET['courseId'])){
                $model = new AdminModel();
                $result = $model -> getCourseById($_GET['courseId']);
                $course = $result['data'][0];

                $result = $model -> getAllStudentOfCourseById($_GET['courseId']);
                $studentArray = $result['data'];

                $result = $model -> getTeacherOfCourseById($_GET['courseId']);
                
                if (sizeof($result['data']) > 0){
                    $teacher = $result['data'][0];
                    $this->renderView('CourseDetail.html', ['course' => $course, "studentArray" => $studentArray, "teacher" => $teacher]);
                }
                else{
                    $this->renderView('CourseDetail.html', ['course' => $course, "studentArray" => $studentArray]);
                }
            }
            else{
                $this->renderView('CourseDetail.html', []);
            }
        }

        public function addTeacherToCourse(){
            if(isset($_POST['teacher-username']) && isset($_POST['course-id'])){
                $teacherUsername = $_POST['teacher-username'];
                $courseId = $_POST['course-id'];

                $model = new AdminModel();

                $result = $model -> getTeacherCourseByUsername($teacherUsername);
                $teacherCourseArray = $result['data'];

                $result = $model -> getTeacherByUsername($teacherUsername);
                $teacher = $result['data'];

                $result = $model -> getCourseById($courseId);
                $courseBooking = $result['data'][0];

                $errorMessage = "";


                if(empty($teacher)){
                    $errorMessage = "<strong>Khônh tìm thấy giáo viên!</strong> Giáo viên không tồn tại";
                }
                else{
                    $result = $model -> getTeacherByUsername($teacherUsername);
                    $teacher = $result['data'][0];
                    $flag = TRUE;

                    for ($i=0; $i < sizeof($teacherCourseArray); $i++) { 
                        if ($teacherCourseArray[$i]['Id'] == $courseId){
                            $errorMessage = "<strong>Khônh thể thêm giáo viên!</strong> Giáo viên đã đăng kí lớp này";

                            $flag = FALSE;
                            break;
                        }
                        
                        else if ( ((($teacherCourseArray[$i]['StartDateCourse'] <= $courseBooking['EndDateCourse']) && ($teacherCourseArray[$i]['EndDateCourse'] >= $courseBooking['StartDateCourse']))
                        || (($teacherCourseArray[$i]['EndDateCourse'] >= $courseBooking['StartDateCourse']) && ($teacherCourseArray[$i]['StartDateCourse'] <= $courseBooking['EndDateCourse']))
                        ) && ($teacherCourseArray[$i]['CourseTime'] == $courseBooking['CourseTime']) ){
                            $errorMessage = "<strong>Khônh thể thêm giáo viên!</strong> Giáo viên này đã có lớp bị trùng lịch với lớp này";

                            $flag = FALSE;
                            break;
                        }
                    }

                    if($flag){
                        $result = $model -> addTeacherToTeacherCourseById($teacher["Id"], $courseId);
                        $headerLocation = "Location: /admin/getCourseDetail?courseId=" . $courseId;
                        header($headerLocation);

                        return NULL;
                    }
                }

                $model = new AdminModel();
                $result = $model -> getCourseById($courseId);
                $course = $result['data'][0];

                $result = $model -> getAllStudentOfCourseById($courseId);
                $studentArray = $result['data'];

                $this->renderView('CourseDetail.html', ['course' => $course, "studentArray" => $studentArray, "errorMessage" => $errorMessage]);
            }
            else{
                $this->getCourses();
            }
        }

        //GET searcheCourse
        public function searchCourse(){
            if(isset($_GET['course-name'])){
                $courseName = $_GET['course-name'];
                $model = new AdminModel();

                if(isset($_GET['course-language'])){
                    $courseLanguage = $_GET['course-language'];
                    $result = $model -> searchCourseByNameAndLanguage($courseName, $courseLanguage);
                    $courseArray = $result['data'];

                    $this->renderView('CourseSearch.html', ['courseArray' => $courseArray]);
                }
                else{
                    $result = $model -> searchCourseByName($courseName);
                    $courseArray = $result['data'];

                    $this->renderView('CourseSearch.html', ['courseArray' => $courseArray]);
                }
            }
            else{
                $this->renderView('CourseSearch.html', []);
            }
        }

        public function deleteCourse(){
            if(isset($_GET['courseId'])){
                $model = new AdminModel();

                $resultDeleteCourse = $model -> deleteCourseById($_GET['courseId']);
                $resultDeleteCourseInTeacherCourse = $model -> deleteCourseInTeacherCourseById($_GET['courseId']);
                $resultDeleteCourseInStudentCourse = $model -> deleteCourseInStudentCourseById($_GET['courseId']);
                
                $this->getCourses();
            }
            else{
                $this->getCourses();
            }
        }

        //GET getStudentPending
        public function getPendingStudentCourse(){
            $model = new AdminModel();
            $result = $model -> getAllPendingStudentCourse();
            $pendingStudentCourseArray = $result['data'];

            $currentDate = strtotime(date('Y-m-d'));
            
            for ($i=0; $i < sizeof($pendingStudentCourseArray); $i++) {
                if($currentDate > strtotime($pendingStudentCourseArray[$i]['StartDateCourse']) 
                    || strtotime($pendingStudentCourseArray[$i]['RegisterDate']) > strtotime($pendingStudentCourseArray[$i]['StartDateCourse'])){
                    $pendingStudentCourseArray[$i] = array_merge($pendingStudentCourseArray[$i], ['Expired' => 'True']);
                }
                else{
                    $pendingStudentCourseArray[$i] = array_merge($pendingStudentCourseArray[$i], ['Expired' => 'False']);
                }
            }
            
            $this->renderView('PendingStudentCourseList.html', ['pendingStudentCourseArray' => $pendingStudentCourseArray]);
        }

        public function updatePendingSCStatusToApproved(){
            if( isset($_GET['studentId']) && isset($_GET['courseId']) ){
                $idStudent = $_GET['studentId'];
                $idCourse = $_GET['courseId'];
                $status = 'Đã duyệt';

                $model = new AdminModel();
                $result = $model->addStudentToCourse($idStudent, $idCourse);
                $result = $model->updateSCPendingStatus($idStudent, $idCourse, $status);

                header('Location: /admin/getPendingStudentCourse');
            }
            else{
                header('Location: /admin/getPendingStudentCourse');
            }
        }
        
        public function updatePendSCStatusToUnapproved(){
            if( isset($_GET['studentId']) && isset($_GET['courseId']) ){
                $idStudent = $_GET['studentId'];
                $idCourse = $_GET['courseId'];
                $status = 'Chưa duyệt';

                $model = new AdminModel();
                $result = $model->deleteStudentFromCourse($idStudent, $idCourse);
                $result = $model->updateSCPendingStatus($idStudent, $idCourse, $status);

                header('Location: /admin/getPendingStudentCourse');
            }
            else{
                header('Location: /admin/getPendingStudentCourse');
            }
        }

        public function deleteStudentCoursePending(){
            if( isset($_GET['studentId']) && isset($_GET['courseId']) ){
                $idStudent = $_GET['studentId'];
                $idCourse = $_GET['courseId'];
                $model = new AdminModel();
                $result = $model->deletePendingStudentCourseById($idStudent, $idCourse);

                header('Location: /admin/getPendingStudentCourse');
            }
            else{
                header('Location: /admin/getPendingStudentCourse');
            }
        }

        public function getPendingCourse(){
            $model = new AdminModel();
            $result = $model -> getAllPendingCourse();
            $pendingCourseArray = $result['data'];

            $this->renderView('PendingCourseList.html', ['pendingCourseArray' => $pendingCourseArray]);
        }

        //GET getPendingCourseDetail
        public function getPendingCourseDetail(){
            if(isset($_GET['id-pending-course'])){
                $idPendingCourse = $_GET['id-pending-course'];

                $model = new AdminModel();
                $result = $model -> getPendingCourseById($idPendingCourse);
                $pendingCourse = $result['data'][0];
                
                $this->renderView('PendingCourseDetail.html', ['pendingCourse' => $pendingCourse]);
            }
            else{
                header('Location: /admin/getPendingCourse');
            }
        }

        //GET addPendingCourse
        public function addPendingCourse(){
            if(isset($_GET['id-pending-course'])){
                $idPendingCourse = $_GET['id-pending-course'];

                $model = new AdminModel();
                $result = $model -> getPendingCourseById($idPendingCourse);
                $pendingCourse = $result['data'][0];

                $idTeacher = $pendingCourse['IdTeacher'];
                $courseName = $pendingCourse['CourseName'];
                $courseImageAddress = $pendingCourse['CourseImageAddress'];
                $courseDescription = $pendingCourse['CourseDescription'];
                $startDateCourse = $pendingCourse['StartDateCourse'];
                $endDateCourse = $pendingCourse['EndDateCourse'];
                $courseTime = $pendingCourse['CourseTime'];
                $courseLanguage = $pendingCourse['CourseLanguage'];
                $coursePrice = $pendingCourse['CoursePrice'];
                $courseSlot = $pendingCourse['CourseSlot'];

                $model = new AdminModel();
                $result = $model->addPendingCourseToCoures($courseName, $courseImageAddress, $courseDescription, $startDateCourse, $endDateCourse, $courseTime, $courseLanguage, $coursePrice, $courseSlot); 
                $course = $result['data'][0];
                $idCourse = $course['Id'];

                $resulAddTeacher = $model -> addTeacherToTeacherCourseById($idTeacher, $idCourse);

                $resultDeletePendingCourse = $model -> deletePendingCourse($idPendingCourse);

                header('Location: /admin/getPendingCourse');
            }
            else{
                header('Location: /admin/getPendingCourse');
            }
        }

        //GET deletePendingCourse
        public function deletePendingCourse(){
            if(isset($_GET['id-pending-course'])){
                $idPendingCourse = $_GET['id-pending-course'];
                $model = new AdminModel();
                $resultDeletePendingCourse = $model -> deletePendingCourse($idPendingCourse);

                header('Location: /admin/getPendingCourse');
            }
            else{
                header('Location: /admin/getPendingCourse');
            }
        }


        public function logout(){
            session_start();
            session_destroy();

            header('Location: /home/index');
        }

    }
?>