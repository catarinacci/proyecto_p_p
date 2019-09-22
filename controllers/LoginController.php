<?php
require_once 'models/login/loginModel.php';
class loginController{
    public function index(){
        require_once 'views/login/login.php';
    }
    
    public function login(){
        if(isset($_POST)){
            //echo 1;
            //Identificar al usuario
            //Consulta a la base de datos
            $usuario = new loginUsuario();
            $usuario->setEmail($_POST['email']);
            $usuario->setPassword($_POST['password']);  
                   
            $identity=$usuario->login();
            //  var_dump( $usuario);
            //       die();
            if($identity && is_object($identity)){
                 $_SESSION['identity']=$identity;
                echo json_encode(array('error'=> false, 'tipo' => $identity->tipo));
                // // die();
                //  if($identity->ID_TIPO == 1){
                //     $_SESSION[0]=true;
                //     header("Location:".base_url."admin/index");
                // }
                // if($identity->ID_TIPO == 2){
                // //  var_dump($_SESSION['identity']->nombre,$identity->ID_TIPO);
                // //  die();
                //     $_SESSION['1']=true;
                //     header("Location:".base_url."recepcionista/index");
                
                // }else{
                //     $_SESSION['error_login'] = 'no es administrador';
                // }
            }else{
                echo json_encode(array('error'=> true));
               //header("Location:".base_url."login/index");
               
            }
            //Crear una session
        }

        //header("Location:".base_url."login/index");
        
    }


    public function logout(){
        if(isset($_SESSION['identity'])){
            unset($_SESSION['identity']);
        }
        if(isset($_SESSION[0])){
            unset($_SESSION[0]);
        }
        header("Location:".base_url."login/index");
    }
}// fin clase