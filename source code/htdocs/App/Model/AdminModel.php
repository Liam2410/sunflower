<?php
    require_once('App/Base/BaseModel.php');

    class AdminModel extends BaseModel{

        function getById($id){
        }

        function getAll(){
            $sql = 'SELECT * FROM Account';
            $result = $this->query($sql);
        }

        function getCourseById($id){
            $sql = 'SELECT * FROM Course WHERE Id = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllCourse(){
            $sql = 'SELECT *, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse GROUP BY course.Id';
            $result = $this->query($sql);

            return $result;
        }

        function addCourse($courseName, $courseImageAddress, $courseDescription, $startDateCourse, $endDateCourse, $courseTime, $courseLanguage, $coursePrice, $courseSlot){
            $sql = 'INSERT INTO Course(CourseName, CourseImageAddress, CourseDescription, StartDateCourse, EndDateCourse, CourseTime, CourseLanguage, CoursePrice, CourseSlot)
            VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?)';
            $params = array('sssssssss', &$courseName, &$courseImageAddress, &$courseDescription, &$startDateCourse, &$endDateCourse, &$courseTime, &$courseLanguage, &$coursePrice, &$courseSlot);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function deleteCourseById($id){
            $sql = 'DELETE FROM Course WHERE Id = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function deleteCourseInTeacherCourseById($id){
            $sql = 'DELETE FROM TeacherCourse WHERE IdCourse = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function deleteCourseInStudentCourseById($id){
            $sql = 'DELETE FROM StudentCourse WHERE IdCourse = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function searchCourseByName($courseName){
            $sql = 'SELECT *, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse WHERE CourseName LIKE ? GROUP BY course.Id';

            $courseName = '%'.$courseName.'%';
            $params = array('s', &$courseName);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function searchCourseByNameAndLanguage($courseName, $courseLanguage){
            $sql = 'SELECT *, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse WHERE course.CourseName LIKE ? AND course.CourseLanguage = ? GROUP BY course.Id';

            $courseName = '%'.$courseName.'%';
            $params = array('ss', &$courseName, &$courseLanguage);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getTeacherOfCourseById($id){
            $sql = 'SELECT * FROM `teachercourse`, `account` WHERE teachercourse.IdCourse = ? AND account.Id = teachercourse.IdTeacher';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllStudentOfCourseById($id){
            $sql = 'SELECT * FROM `studentcourse`, `account` WHERE studentcourse.IdCourse = ? AND account.Id = studentcourse.IdStudent';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addTeacherToAccount($username, $password, $fullname, $email, $avatarURL, $dateOfBirth){
            if($avatarURL != ''){
                $sql = 'INSERT INTO Account(Username, Password, Role, Fullname, Email, AvatarURL, DateOfBirth) VALUES (?, ?, ?, ?, ?, ?, ?)';
                $role = 'Teacher';
                
                $params = array('sssssss', &$username, &$password, &$role, &$fullname, &$email, &$avatarURL, &$dateOfBirth);
                $result = $this->queryPrepared($sql, $params);
    
                return $result;
            }

            $avatarURL = '/App/View/Source/Image/Teacher/avatar-default.png';
            $role = 'Teacher';
            
            $sql = 'INSERT INTO Account(Username, Password, Role, Fullname, Email, AvatarURL, DateOfBirth) VALUES (?, ?, ?, ?, ?, ?, ?)';
            $role = 'Teacher';
            
            $params = array('sssssss', &$username, &$password, &$role, &$fullname, &$email, &$avatarURL, &$dateOfBirth);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addTeacherToAccountTeacher($username, $language, $degree, $phone, $rating){
            $sql = 'INSERT INTO AccountTeacher(Username, Language, Degree, PhoneNumber, Rating) VALUES (?, ?, ?, ?, ?)';
            $params = array('sssss', &$username, &$language, &$degree, &$phone, &$rating);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllTeacher(){
            $sql = 'SELECT * FROM `Account` JOIN `AccountTeacher` ON Account.Username = AccountTeacher.Username';
            $result = $this->query($sql);

            return $result;
        }

        function getTeacherByUsername($username){
            $sql = 'SELECT * FROM Account, AccountTeacher 
            WHERE Account.Username = ? AND AccountTeacher.Username = ?';
            $params = array('ss', &$username, &$username);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getTeacherCourseByUsername($username){
            $sql = 'SELECT * FROM Account, TeacherCourse, Course WHERE Account.Id = TeacherCourse.IdTeacher AND Account.Username = ? AND TeacherCourse.IdCourse = Course.Id';
            $params = array('s', &$username);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function deleteTeacherByUsername($username){
            $sql = 'DELETE account, accountteacher 
            FROM account, accountteacher 
            WHERE account.Username = ? AND accountteacher.Username = ?';
            $params = array('ss', &$username, &$username);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function deleteTeacherInCourseById($id){
            $sql = 'DELETE FROM teachercourse 
            WHERE teachercourse.IdTeacher = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function searchTeacherByName($fullname){
            $sql = 'SELECT * FROM `Account` JOIN `AccountTeacher` USING(Username) WHERE Account.Fullname LIKE ?';
            $fullname = '%'.$fullname.'%';
            $params = array('s', &$fullname);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function updateTeacherInformationByUsername($username, $email, $fullname, $language, $phone, $avatarURL, $degree){
            if($avatarURL == NULL){
                $sql = 'UPDATE Account
                SET Fullname = ?, Email = ?
                WHERE Username = ?';

                $params = array('sss', &$fullname, &$email, &$username);
                $result = $this->queryPrepared($sql, $params);

                $sql = 'UPDATE AccountTeacher
                SET Language = ?, PhoneNumber = ?, Degree = ?
                WHERE Username = ?';

                $params = array('ssss', &$language, &$phone, &$degree, &$username);
                $result = $this->queryPrepared($sql, $params);

                return $result;
            }
            $sql = 'UPDATE Account
            SET Fullname = ?, Email = ?, AvatarURL = ?
            WHERE Username = ?';

            $params = array('ssss', &$fullname, &$email, &$avatarURL, &$username);
            $result = $this->queryPrepared($sql, $params);

            $sql = 'UPDATE AccountTeacher
            SET Language = ?, PhoneNumber = ?, Degree = ?
            WHERE Username = ?';

            $params = array('ssss', &$language, &$phone, &$degree, &$username);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function searchTeacherByNameAndLang($fullname, $language){
            $sql = 'SELECT * FROM `Account` JOIN `AccountTeacher` USING(Username) WHERE Account.Fullname LIKE ? AND AccountTeacher.Language = ?';
            $fullname = '%'.$fullname.'%';
            $params = array('ss', &$fullname, &$language);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addTeacherToTeacherCourseById($teacherId, $courseId){
            $sql = 'INSERT INTO TeacherCourse(IdTeacher, IdCourse) VALUE(?, ?)';
            $params = array('ss', &$teacherId, &$courseId);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getTeacherCommentRatingById($teacherId){
            $sql = 'SELECT *, commentRating.Id AS commentRatingId FROM CommentRating, Account 
            WHERE CommentRating.IdStudent = Account.Id AND CommentRating.IdTeacher = ?
            ORDER BY CommentRating.CommentDate DESC';
            $params = array('s', &$teacherId);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function deleteCommentRatingById($idCommentRating){
            $sql = 'DELETE FROM CommentRating
            WHERE CommentRating.Id = ?';
            $params = array('s', &$idCommentRating);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllStudent(){
            $sql = 'SELECT * FROM `Account` WHERE Role = ?';
            $role = 'Student';
            $params = array('s', &$role);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getStudentById($id){
            $sql = 'SELECT * FROM `Account` WHERE Id = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function searchStudentByName($fullname){
            $sql = 'SELECT * FROM Account WHERE Fullname LIKE ? AND Role = ?';
            $role = 'Student';
            $fullname = '%'.$fullname.'%';
            $params = array('ss', &$fullname, &$role);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getStudentCourseById($id){
            $sql = 'SELECT * FROM StudentCourse, Course WHERE StudentCourse.IdStudent = ? AND StudentCourse.IdCourse = Course.Id';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deleteStudentById($id){
            $sql = 'DELETE FROM `Account` WHERE Id = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deleteStudentInCourseById($id){
            $sql = 'DELETE FROM `StudentCourse` WHERE IdStudent = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deleteStudentInCommentRating($id){
            $sql = 'DELETE FROM `CommentRating` WHERE IdStudent = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deleteStudentInPendingStudentCourse($id){
            $sql = 'DELETE FROM `PendingStudentCourse` WHERE IdStudent = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addNews($titleNews, $newsImageAddress, $newsDescription, $newsContent, $newsReleaseDate, $newsCategory){
            $sql = 'INSERT INTO News(NewsTitle, NewsImageAddress, NewsDescription, NewsContent, NewsReleaseDate, NewsCategory) VALUES(?, ?, ?, ?, ?, ?)';
            $params = array('ssssss', &$titleNews, &$newsImageAddress, &$newsDescription, &$newsContent, &$newsReleaseDate, &$newsCategory);
            $result = $this->queryPrepared($sql, $params);
        
            return $result;
        }
        
        function getAllNews(){
            $sql = 'SELECT * FROM `News`';
            $result = $this->query($sql);

            return $result;
        }


        function getAllPendingStudentCourse(){
            $sql = 'SELECT * 
            FROM PendingStudentCourse, Account, Course 
            WHERE pendingstudentcourse.IdStudent = account.Id AND pendingstudentcourse.IdCourse = course.Id';
            $result = $this->query($sql);

            return $result;
        }

        function updateSCPendingStatus($idStudent, $idCourse, $status){
            $sql = 'UPDATE PendingStudentCourse
            SET Status = ? 
            WHERE IdStudent = ? AND IdCourse = ?';
            $params = array('sss', &$status, &$idStudent, &$idCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addStudentToCourse($idStudent,$idCourse){
            $sql = 'INSERT INTO StudentCourse(IdStudent, IdCourse) VALUE (?, ?)';
            $params = array('ss', &$idStudent, &$idCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deleteStudentFromCourse($idStudent, $idCourse){
            $sql = 'DELETE FROM StudentCourse WHERE IdStudent = ? AND IdCourse = ?';
            $params = array('ss', &$idStudent, &$idCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deletePendingStudentCourseById($idStudent, $idCourse){
            $sql = 'DELETE FROM `PendingStudentCourse` WHERE IdStudent = ? AND IdCourse = ?';
            $params = array('ss', &$idStudent, &$idCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function getAllPendingCourse(){
            $sql = 'SELECT *, PendingCourse.Id AS IdPendingCourse FROM `PendingCourse`, `Account`, `AccountTeacher` 
            WHERE pendingcourse.IdTeacher = account.Id AND account.Username = accountteacher.Username';
            $result = $this->query($sql);

            return $result;
        }

        public function getPendingCourseById($id){
            $sql = 'SELECT *, PendingCourse.Id AS IdPendingCourse FROM `PendingCourse`, `Account`, `AccountTeacher` 
            WHERE pendingcourse.Id = ? AND pendingcourse.IdTeacher = account.Id 
            AND account.Username = accountteacher.Username';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function addPendingCourseToCoures($courseName, $courseImageAddress, $courseDescription, $startDateCourse, $endDateCourse, $courseTime, $courseLanguage, $coursePrice, $courseSlot){
            $sql = 'INSERT INTO Course(CourseName, CourseImageAddress, CourseDescription, StartDateCourse, EndDateCourse, CourseTime, CourseLanguage, CoursePrice, CourseSlot)
            VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?)';
            $params = array('sssssssss', &$courseName, &$courseImageAddress, &$courseDescription, &$startDateCourse, &$endDateCourse, &$courseTime, &$courseLanguage, &$coursePrice, &$courseSlot);
            $result = $this->queryPrepared($sql, $params);

            $sql = 'SELECT * FROM Course WHERE CourseName = ?';
            $params = array('s', &$courseName);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        public function deletePendingCourse($idPendingCourse){
            $sql = 'DELETE FROM PendingCourse WHERE Id = ?';
            $params = array('s', &$idPendingCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

    }

?>