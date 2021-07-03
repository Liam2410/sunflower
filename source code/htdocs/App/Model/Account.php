<?php
    class Account{
        public $username;
        public $password;
        public $role;

        public function __construct($username, $password, $role){
            self::$username = $username;
            self::$password = $password;
            self::$role = $role;
        }
    }

?>