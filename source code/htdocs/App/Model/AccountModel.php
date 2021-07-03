<?php
    require_once('App/Base/BaseModel.php');
    class AccountModel extends BaseModel{

        function getAll(){
            $sql = 'SELECT * FROM Account';
            $result = $this->query($sql);
        }

        function getById($id){
            $sql = 'SELECT * FROM Account WHERE Id = ?';
            $params = array('s', &$id);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function getAccount($username, $password){
            $sql = 'SELECT * FROM Account WHERE Username = ? AND Password = ?';
            $params = array('ss', &$username, &$password);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }
        
        function checkExistAccount($username){
            $sql = 'SELECT * FROM Account WHERE Username = ?';
            $params = array('s', &$username);
            $result = $this->queryPrepared($sql, $params);

            if ($result["code"] == 0 && sizeof($result['data']) == 0){
                return false;
            }
            return true;
        }

        function checkExistUsername($username){
            $sql = 'SELECT * FROM Account WHERE Username = ?';
            $params = array('s', &$username);
            $result = $this->queryPrepared($sql, $params);

            if ($result["code"] == 0 && sizeof($result['data']) == 0){
                return false;
            }
            return true;
        }

        function checkExistEmail($email){
            $sql = 'SELECT * FROM Account WHERE Email = ?';
            $params = array('s', &$email);
            $result = $this->queryPrepared($sql, $params);

            if ($result["code"] == 0 && sizeof($result['data']) == 0){
                return false;
            }
            return true;
        }

        function addNewStudentAccount($username, $password, $fullname, $email, $dateOfBirth){
            $role = "Student";

            if (!$this->checkExistAccount($username)){
                $sql = 'INSERT INTO Account(Username, Password, Role, Fullname, Email, DateOfBirth) VALUES (?, ?, ?, ?, ?, ?)';
                $params = array('ssssss', &$username, &$password, &$role, &$fullname, &$email, &$dateOfBirth);
                $result = $this->queryPrepared($sql, $params);

                return true;
            }
            return false;
        }

        function updatePasswordByUsername($username, $password){
            $sql = 'UPDATE Account SET password = ? WHERE username = ?';
            $params = array('ss', &$password, &$username);
            $result = $this->queryPrepared($sql, $params);

            return $result;
        }

        function editInformation($fullname, $email, $dateOfBirth, $avatarURL, $id){
            if($avatarURL == NULL){
                $sql = 'UPDATE Account SET Fullname = ? , Email = ? , DateOfBirth = ? Where Id= ? ' ;
                $params = array('sssi', &$fullname, &$email, &$dateOfBirth, &$id);
                $result = $this->queryPrepared($sql, $params);
    
                return $result;
            }

            $sql = 'UPDATE Account SET Fullname = ? , Email = ? , DateOfBirth = ?, AvatarURL = ? Where Id= ? ' ;
            $params = array('ssssi', &$fullname, &$email, &$dateOfBirth, &$avatarURL, &$id);
            $result = $this->queryPrepared($sql, $params);
 
            return $result;
        }
    }
?>