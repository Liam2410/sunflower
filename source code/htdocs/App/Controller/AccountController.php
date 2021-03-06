<?php
    require_once('App/Model/AccountModel.php');

    class AccountController extends BaseController{

        //GET register
        public function register(){
            $this->renderView('Register.html', []);
        }

        //GET detail
        public function detail(){
            if(isset($_SESSION['username'])){
                $fullname = $_SESSION['fullname'];
                $email = $_SESSION['email']; 
                $date = $_SESSION['dateOfBirth'];
    
                if(isset($_SESSION['id'])){
                    $model = new AccountModel();
                    $result = $model -> getById($_SESSION['id']);
                    $account = $result['data'][0];
    
                    $this->renderView('Detail.html',['fullname' => $fullname, "account" => $account]);
                }
                else{
                    $this->login();
                }
            }
            else{
                $this->login();
            }
        }

        //GET changePassword
        public function changePassword(){
            if(isset($_SESSION['username'])){
                $fullname = $_SESSION['fullname'];

                $this->renderView('ChangePassword.html', ['fullname' => $fullname]);
            }
            else{
                $this->login();
            }
        }

        //POST changePasswordPost
        public function changePasswordPost(){
            if(isset($_SESSION['username'])){
                if($_POST['old-password'] && $_POST['new-password']){
                    $fullname = $_SESSION['fullname'];

                    $model = new AccountModel();
                    $result = $model -> getById($_SESSION['id']);

                    $username = $result['data'][0]['Username'];
                    $oldHashedPassword = md5($_POST['old-password']);

                    $result = $model -> getAccount($username, $oldHashedPassword);

                    $newHashedPassword = md5($_POST['new-password']);

                    if($result['code'] == 0 && sizeof($result['data']) > 0){
                        $result = $model -> updatePasswordByUsername($username, $newHashedPassword);
                        $message = '<strong>???? c???p nh???t m???t kh???u !</strong> ????? quay l???i trang ch??? <a href="/home/index" class="text-success">click v??o ????y.</a>';

                        $this->renderView('ChangePassword.html', ['message' => $message, 'fullname' => $fullname]);
                    }
                    else{
                        $errorMessage = '<strong>C???p nh???t m???t kh???u th???t b???i !</strong> M???t kh???u b???n v???a nh???p kh??ng ????ng vui l??ng ki???m tra l???i';

                        $this->renderView('ChangePassword.html', ['errorMessage' => $errorMessage, 'fullname' => $fullname]);
                    }
                }
            }
            else{
                $this->login();
            }
        }

        public function uploadImage($targetDir, $nameInput){
            $targetFile = $targetDir . time() . basename($_FILES[$nameInput]['name']);
            $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

            if ($imageFileType != "jpg" && $imageFileType != "jpeg" && $imageFileType != "png"){
                echo "File kh??ng ????ng ?????nh d???nh cho ph??p";
                return "";
            }
            move_uploaded_file($_FILES[$nameInput]["tmp_name"], $targetFile);
            return $targetFile;
        }

        //POST save
        public function save(){
            if( isset($_SESSION['id']) && isset($_POST['fullname']) && isset($_POST['email']) && isset($_POST['date']) ){
                $id = $_SESSION["id"];
                $fullname = $_POST['fullname']; 
                $email = $_POST['email']; 
                $dateOfBirth = $_POST['date'];

                if(isset($_FILES['avatar-image'])){
                    if( $_FILES['avatar-image']['name'] ){
                        $targetDir = "App/View/Source/Image/Student/";
                        $nameInput = "avatar-image";
                        $avatarURL = '/' . $this->uploadImage($targetDir, $nameInput);
                    }
                    else{
                        $avatarURL = '';
                    }
                }
                else{
                    $avatarURL = '';
                }

                $model = new AccountModel();
                $result = $model -> editInformation($fullname, $email, $dateOfBirth, $avatarURL, $id);

                $result = $model -> getById($id);
                $account = $result['data'][0];

                $_SESSION["fullname"] = $account['Fullname'];

                $message = '<strong>???? c???p nh???t th??ng tin c?? nh??n !</strong> ????? quay l???i trang ch??? <a href="/home/index" class="text-success">click v??o ????y.</a>';
                
                $this->renderView('Detail.html',["account" => $account, 'message' => $message, 'fullname' => $fullname]);
            }
            else{
                $this->login();
            }
        }

        //GET login
        public function login(){
            if( isset($_SESSION["username"]) && isset($_SESSION["role"]) ){
                if($_SESSION['role'] == 'Student'){
                    header("Location: /home/index");
                    exit();
                }
                if($_SESSION['role'] == 'Admin'){
                    header("Location: /admin/index");
                    exit();
                }
                if($_SESSION['role'] == 'Teacher'){
                    header("Location: /teacher/index");
                    exit();
                }
            }

            $this->renderView('login.html', []);
        }

        //POST login
        public function loginPost(){
            if(isset($_SESSION["username"]) && isset($_SESSION["role"])){
                if($_SESSION['role'] == 'Student'){
                    header("Location: /home/index");
                    exit();
                }
                if($_SESSION['role'] == 'Admin'){
                    header("Location: /admin/index");
                    exit();
                }
                if($_SESSION['role'] == 'Teacher'){
                    header("Location: /teacher/index");
                    exit();
                }
            }

            if(isset($_POST["username"]) && isset($_POST["password"])){

                $username = $_POST["username"];
                $password = $_POST["password"];

                $hashedPassword = md5($password);

                $model = new AccountModel();
                $result = $model -> getAccount($username, $hashedPassword);
                
                if($result['code'] == 0){
                    if (sizeof($result['data']) == 1){
                        $_SESSION["username"] = $username;
                        $_SESSION["id"] = $result["data"][0]["Id"];
                        $_SESSION["role"] = $result["data"][0]["Role"];
                        $_SESSION["fullname"] = $result["data"][0]["Fullname"];
                        $_SESSION["email"] = $result["data"][0]["Email"];
                        $_SESSION["dateOfBirth"] = $result["data"][0]["DateOfBirth"];

                        if($result["data"][0]["Role"] == "Admin"){
                            header("Location: /admin/index");
                        }
                        else if($result["data"][0]["Role"] == "Teacher"){
                            header("Location: /teacher/index");
                        }
                        else{
                            header("Location: /home/index");
                        }
                    }
                    else{
                        $data = ["errorMessage" => "T??n ????ng nh???p ho???c m???t kh???u kh??ng ????ng"];
                        echo $this->renderView("login.html", $data);
                    }
                }
                else{
                    $data = array("errorMessage" => $result['error']);
                    echo $this->renderView("login.html", $data);
                }
            }
            else{
                $data = array("errorMessage" => "Vui l??ng nh???p ?????y ????? t??n ????ng nh???p v?? m???t kh???u");
                echo $this->renderView("login.html", $data);
            }
        }

        //GET logout
        public function logout(){
            session_destroy();

            $this->renderView("Logout.html", []);
        }

        //POST register
        public function registerPost(){
            $username = $_POST["username"];
            $password = $_POST["password"];
            $fullname = $_POST["fullname"];
            $email = $_POST["email"];
            $dateOfBirth = $_POST["date"];
            
            $model = new AccountModel();

            $emailExist = $model -> checkExistEmail($email);
            $usernameExist = $model -> checkExistUsername($username);

            if($emailExist){
                $this->renderView('Register.html', ['errorMessage' => 'Email ???? ???????c s??? d???ng']);
                exit();
            }
            elseif($usernameExist){
                $this->renderView('Register.html', ['errorMessage' => 'T??n ????ng nh???p ???? ???????c s??? d???ng']);
                exit();
            }

            $hashedPassword = md5($password);
            $result = $model -> addNewStudentAccount($username, $hashedPassword, $fullname, $email, $dateOfBirth);

            if($result){
                header('Location: /account/login');
            }
            else{
                header('Location: /account/register');
            }
        }
        
    }
?>