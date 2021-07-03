<?php
    class ErrorController extends BaseController{
        public function index(){
            $this->renderView('Error.html', []);
        }

        public function unauthorizedError(){
            $code = '<span>4</span><span>0</span><span>1</span>';
            $errorTitle = 'Truy cập bị từ chối';
            $errorMessage = 'Bạn không có quyền truy cập vào trang web này';

            $this->renderView('Error.html', ['code' => $code, 'errorTitle' => $errorTitle, 'errorMessage' => $errorMessage]);
        }

        public function notFoundError(){
            $code = '<span>4</span><span>0</span><span>4</span>';
            $errorTitle = 'Không tìm thấy';
            $errorMessage = 'Trang bạn yêu cầu không tồn tại';

            $this->renderView('Error.html', ['code' => $code, 'errorTitle' => $errorTitle, 'errorMessage' => $errorMessage]);
        }

        public function forbiddenError(){
            $code = '<span>4</span><span>0</span><span>3</span>';
            $errorTitle = 'Bị cấm';
            $errorMessage = 'Bạn không thể xem nội dung này';

            $this->renderView('Error.html', ['code' => $code, 'errorTitle' => $errorTitle, 'errorMessage' => $errorMessage]);
        }
    }
?>