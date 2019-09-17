<?php


class loginUsuario {
    private $email;
    private $password;
    private $tipo;

    private $db;

    public function __construct()
    {
        $this->db=Database::connect();
    }
    function getEmail(){
        return $this->email;
    }
    function getPassword(){
        return $this->password;
    }
    function getTipo(){
        return $this->tipo;
    }
    function setEmail($email){
        $this->email=$email;
    }
    function setPassword($password){
        $this->password=$password;
    }
    function setTipo($tipo){
        $this->tipo=$tipo;
    }
    
    public function login(){
        $result=false;
        $email=$this->getEmail();
        $password=$this->getPassword();
        //Comprobar si existe el usuario
        $sql = "SELECT ID_USUARIO, pass, ID_TIPO, nombre FROM usuario WHERE email = '$email'";
        
        $login = $this->db->query($sql);
        
        if($login && $login->num_rows==1){
            $usuario = $login->fetch_object();
            
            //Verificar la contraceña
            //$verify= password_verify($password, $usuario->pass);
            if($password == $usuario->pass){
                $verify=true;
            }else{
                $verify=false;
            }
            // var_dump($usuario->pass , $password , $verify);
            // die();
            if($verify){
                $result=$usuario;
                
            }
        }
        return $result;
        
    }
}

