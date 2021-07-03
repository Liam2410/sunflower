<?php
    require_once('App/Base/BaseModel.php');

    class RatingModel extends BaseModel{
        function getAll(){
        }

        function getById($id){
        }

        function getAllTeacher(){
            $sql = 'SELECT *, COUNT(teachercourse.IdCourse) AS NumberCourse, teachercourse.IdTeacher AS IdTeacherCourse 
            FROM account, accountteacher, teachercourse
            WHERE account.Username = accountteacher.Username 
            AND account.Id = teachercourse.IdTeacher 
            GROUP BY(account.Username)';
            $result = $this->query($sql);

            return $result;
        }

        function getTeacherRatingPointById($idTeacher){

        }

        function getTeacherInforById($id){
            $sql = 'SELECT * FROM account, accountteacher
            WHERE account.Id = ? AND account.Username = accountteacher.Username';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getTeacherById($id){
            $sql = 'SELECT *, AVG(CommentRating.RatingPoint) AS AvgRating 
            FROM Account, AccountTeacher, CommentRating 
            WHERE Account.Id = ? AND Account.Username = AccountTeacher.Username
            AND CommentRating.IdTeacher = ?';
            $params = array('ss', &$id, &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getCommentRatingByIdTeacher($id){
            $sql = 'SELECT * 
            FROM CommentRating, Account 
            WHERE CommentRating.IdStudent = Account.Id AND CommentRating.IdTeacher = ?
            ORDER BY CommentRating.CommentDate DESC';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function addNewComment($idStudent, $idTeacher, $ratingPoint, $commentContent, $commentDate){
            $sql = 'INSERT INTO CommentRating (`IdStudent`, `IdTeacher`, `RatingPoint`, `CommentContent`, `CommentDate`)
                    VALUES(?, ?, ?, ?, ?)';
            $params = array('sssss', &$idStudent, &$idTeacher, &$ratingPoint, &$commentContent, &$commentDate);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getRatingCountById($idTeacher){
            $sql = 'SELECT *, COUNT(commentrating.RatingPoint) AS NumberRating 
            FROM `commentrating` WHERE commentrating.IdTeacher = ? GROUP BY commentrating.RatingPoint 
            ORDER BY commentrating.RatingPoint DESC';
            $params = array('s', &$idTeacher);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getStudentAndTeacher($idStudent, $idTeacher){
            $sql = 'SELECT * FROM studentcourse, teachercourse 
            WHERE studentcourse.IdStudent = ? AND studentcourse.IdCourse = teachercourse.IdCourse 
            AND teachercourse.IdTeacher = ?';
            $params = array('ss', &$idStudent, &$idTeacher);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

    }
?>