<?php
require_once 'models/login/loginModel.php';
class loginController{
    public function index(){
        require_once 'views/login/login.php';
    }
    
    public function login(){
        if(isset($_POST)){
            //Identificar al usuario
            //Consulta a la base de datos
            $usuario = new loginUsuario();
            $usuario->setEmail($_POST['email']);
            $usuario->setPassword($_POST['password']);  
                   
            $identity=$usuario->login();
          
            if($identity && is_object($identity)){
                //Crear una session
                 $_SESSION['identity']=$identity;
                echo json_encode(array('error'=> false, 'tipo' => $identity->tipo));
               
            }else{
                echo json_encode(array('error'=> true));
               //header("Location:".base_url."login/index");
               
            }
            
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