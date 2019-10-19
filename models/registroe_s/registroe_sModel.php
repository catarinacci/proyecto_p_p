<?php

class registrosUsuarios{
    
    private $id_cliente;
    private $db;

    public function __construct()
    {
        $this->db=Database::connect();
    }

    function getId_cliente (){
        return $this->id_cliente;
    }
    function setId_cliente($id_cliente){
        $this->id_cliente=$id_cliente;
        
    }
    public function registro(){
        $id_cliente=$this->getId_cliente();

        $sql="SELECT (u.nombre) as 'nombre', u.apellido, p.fecha_vencimiento FROM usuario u JOIN pago p ON u.ID_USUARIO = p.ID_USUARIO WHERE u.DNI = $id_cliente";

        $sqlId = $this->db->query($sql);
       
        if($sqlId && $sqlId->num_rows==1){

            $Id = $sqlId->fetch_object();
           
            if($Id){
                $result=$Id;
            }else{
                $result="Errooorr";
            }
        }
        // var_dump($result);
        // echo $result->nombre;
        
        // die();
        return $result;
        
        // echo($result);
        // die();
    }
}