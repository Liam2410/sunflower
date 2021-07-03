<?php
    require_once('App/Base/BaseModel.php');
    class HomeModel extends BaseModel{
        function getAll(){
        }

        function getById($id){
        }
        /*
        function getTeacherOfCourseById($courseId){
            $sql = "SELECT * 
            FROM Account, AccountTeacher, TeacherCourse 
            WHERE Account.Id = TeacherCourse.IdTeacher AND Account.Username = AccountTeacher.Username 
            AND TeacherCourse.IdCourse = ?";
            $params = array('s', &$courseId);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }*/

        function getCourseByLanguage($courseLanguage, $numberCourse){
            $sql = "SELECT *, course.Id AS IdCourse, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse 
            FROM(SELECT * FROM Course WHERE CourseLanguage = ? ORDER BY RAND() LIMIT ?) course 
            LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse 
            LEFT JOIN teachercourse ON  teachercourse.IdCourse = course.Id 
            LEFT JOIN account ON teachercourse.IdTeacher = account.Id GROUP BY course.Id";

            $params = array('ss', &$courseLanguage, &$numberCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getHottestNews($numberNews){
            $sql = 'SELECT * FROM `News` ORDER BY NewsReleaseDate DESC LIMIT ?';
            $params = array('s', &$numberNews);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getRandomNews($numberNews){
            $sql = 'SELECT * FROM `News` ORDER BY RAND() LIMIT ?';
            $params = array('s', &$numberNews);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }
    }
?>