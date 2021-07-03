<?php
    require_once('App/Base/BaseModel.php');
    class CourseModel extends BaseModel{
        function getAll(){
        }

        function getById($id){
        }

        function getCourseById($id){
            $sql = 'SELECT * FROM Course WHERE Id = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAllCourse(){
            $sql = 'SELECT *, course.Id AS IdCourse, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse 
            FROM course 
            LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse 
            LEFT JOIN teachercourse ON  teachercourse.IdCourse = course.Id 
            LEFT JOIN account ON teachercourse.IdTeacher = account.Id GROUP BY course.Id';
            $result = $this->query($sql);

            return $result;
        }

        function searchCourseByName($courseName){
            $sql = 'SELECT *, course.Id AS IdCourse, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse 
            FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse 
            LEFT JOIN teachercourse ON  teachercourse.IdCourse = course.Id 
            LEFT JOIN account ON teachercourse.IdTeacher = account.Id 
            WHERE CourseName LIKE ?  GROUP BY course.Id';

            $courseName = '%'.$courseName.'%';
            $params = array('s', &$courseName);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function searchCourseByNameAndLanguage($courseName, $courseLanguage){
            $sql = 'SELECT *, course.Id AS IdCourse, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse 
            FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse 
            LEFT JOIN teachercourse ON  teachercourse.IdCourse = course.Id 
            LEFT JOIN account ON teachercourse.IdTeacher = account.Id 
            WHERE course.CourseName LIKE ? AND course.CourseLanguage = ? GROUP BY course.Id';

            $courseName = '%'.$courseName.'%';
            $params = array('ss', &$courseName, &$courseLanguage);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getStudentCourseByStudentId($id){
            $sql = 'SELECT * 
            FROM StudentCourse, 
            (SELECT *, COUNT(studentcourse.IdStudent) AS NumberStudentInCourse 
            FROM course LEFT JOIN studentcourse ON course.Id = studentcourse.IdCourse GROUP BY course.Id) Course
            WHERE StudentCourse.IdStudent = ? AND StudentCourse.IdCourse = Course.Id';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getStudentPendingByStudentId($id){
            $sql = 'SELECT * 
            FROM PendingStudentCourse, 
            (SELECT *, COUNT(PendingStudentCourse.IdStudent) AS NumberStudentInCourse 
            FROM course LEFT JOIN PendingStudentCourse ON course.Id = PendingStudentCourse.IdCourse GROUP BY course.Id) Course 
            WHERE PendingStudentCourse.IdStudent = ? AND PendingStudentCourse.IdCourse = Course.Id';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addStudentToCourse($idStudent,$idCourse){
            $sql = 'INSERT INTO StudentCourse(IdStudent, IdCourse) VALUE (?, ?)';
            $params = array('ss', &$idStudent, &$idCourse);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addStudentToPending($idStudent, $idCourse, $registerDate, $status){
            $sql = 'INSERT INTO PendingStudentCourse(IdStudent, IdCourse, RegisterDate, Status) VALUE (?, ?, ?, ?)';
            $params = array('ssss', &$idStudent, &$idCourse, &$registerDate, &$status);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

    }
?>