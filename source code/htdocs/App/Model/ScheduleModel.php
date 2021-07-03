<?php
    require_once('App/Base/BaseModel.php');
    class ScheduleModel extends BaseModel{
        function getAll(){
        }

        function getById($id){
        }

        function getStudentCourseById($id){
            $sql = 'SELECT * FROM StudentCourse, Course WHERE StudentCourse.IdStudent = ? AND StudentCourse.IdCourse = Course.Id';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getPendingStudentCourseById($id){
            $sql = 'SELECT * FROM PendingStudentCourse, Course 
            WHERE PendingStudentCourse.IdStudent = ? AND PendingStudentCourse.IdCourse = Course.Id';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        
    }
?>