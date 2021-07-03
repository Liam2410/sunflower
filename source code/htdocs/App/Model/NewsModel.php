<?php
    require_once('App/Base/BaseModel.php');

    class NewsModel extends BaseModel{
        function getAll(){
        }

        function getById($id){
        }

        function getNewsById($id){
            $sql = 'SELECT * FROM `News` WHERE Id = ?';
            $params = array('s', &$id);

            $result = $this->queryPrepared($sql, $params);
            return $result;
        }

        function getAllNews(){
            $sql = 'SELECT * FROM `News`';
            $result = $this->query($sql);

            return $result;
        }

        function getNewsByNewsTitle($newsTitle){
            $sql = 'SELECT * FROM News WHERE NewsTitle LIKE ?';

            $newsTitle = '%'.$newsTitle.'%';
            $params = array('s', &$newsTitle);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getRandomNews($numberNews){
            $sql = 'SELECT * FROM `News` ORDER BY RAND() LIMIT ?';
            $params = array('s', &$numberNews);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getNewsByCategory($numberNews, $newsCategory){
            $sql = 'SELECT * FROM `News` WHERE NewsCategory = ? LIMIT ?';
            $params = array('ss', &$newsCategory, &$numberNews);
            $result = $this->queryPrepared($sql, $params);
            
            return $result;
        }

    }
?>