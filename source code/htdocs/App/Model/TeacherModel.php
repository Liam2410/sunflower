<?php
    require_once('App/Base/BaseModel.php');

    class TeacherModel extends BaseModel{

        function getById($id){
            $sql = 'SELECT * FROM Account, AccountTeacher WHERE Id = ? AND Account.Username = AccountTeacher.Username';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAll(){
            
        }
        

        function getAllCourse(){
            $sql = 'SELECT *, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse GROUP BY course.Id';
            $result = $this->query($sql);

            return $result;
        }

        function searchCourseByName($courseName){
            $sql = 'SELECT *, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse WHERE CourseName LIKE ? GROUP BY course.Id';

            $courseName = '%'.$courseName.'%';
            $params = array('s', &$courseName);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllTeacher(){
            $sql = 'SELECT * FROM `Account` JOIN `AccountTeacher` ON Account.Username = AccountTeacher.Username';
            $result = $this->query($sql);

            return $result;
        }

        function getTeacherByUsername($username){
            $sql = 'SELECT * FROM `Account` JOIN `AccountTeacher` ON Account.Username = ? AND AccountTeacher.Username = ?';
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

        function addPendingCourse($idTeacher, $registerDate, $courseName, $courseImageAddress, $courseDescription, $startDateCourse, $endDateCourse, $courseTime, $courseLanguage, $coursePrice, $courseSlot){
            $sql = 'INSERT INTO PendingCourse(IdTeacher, RegisterDate, CourseName, CourseImageAddress, CourseDescription, StartDateCourse, EndDateCourse, CourseTime, CourseLanguage, CoursePrice, CourseSlot)
            VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

            $params = array('sssssssssss', &$idTeacher, &$registerDate, &$courseName, &$courseImageAddress, &$courseDescription, &$startDateCourse, &$endDateCourse, &$courseTime, &$courseLanguage, &$coursePrice, &$courseSlot);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllPendingCourse(){
            $sql = 'SELECT * FROM PendingCourse';
            $result = $this->query($sql);

            return $result;
        }
    }

?>