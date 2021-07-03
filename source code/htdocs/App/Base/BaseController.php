<?php
    class BaseController{
        private $twig;

        public function __construct(){
            $loader = new \Twig\Loader\FilesystemLoader('App/View');
            $this->twig = new \Twig\Environment($loader);
        }

        public function index(){
            echo "Index is working on" . get_called_class();
        }

        public function renderView($viewName, $data){
            $viewFolder = get_called_class();
            $viewFolder = str_replace('Controller', '', $viewFolder);
            $viewFolder = ucfirst($viewFolder);

            $viewPath = "$viewFolder/$viewName";
            echo $this->twig->render($viewPath, $data);
        }
    }
?>