<?php
    class Database{
        private static $db;
        private function __construct(){
            
        }

        public static function open(){
            if(self::$db == NULL){
                self::$db = new mysqli('127.0.0.1', 'root', '', 'SunflowerDatabase');
            }
            return self::$db;
        }
    }
?>