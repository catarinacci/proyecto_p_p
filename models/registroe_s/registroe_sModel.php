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

    public function mostrar_tabla(){

        $query="SELECT nombre,apellido,DNI,fecha,hora_entrada,hora_salida FROM consultas LIMIT 20 ";
        $this->db->set_charset('utf8');
            $result=$this->db->query($query);
            $array=array();

            while($re=$result->fetch_array()){
                $array[]=$re;
            } 
        return $array;
    //     var_dump($array);
     }

    public function consultas($valor){

         if ($valor===false){
        }else{
            $q=$valor;
            //$q= $this->db->real_escape_string($valor);
            $query="SELECT nombre,apellido,DNI,fecha,hora_entrada,hora_salida FROM consultas WHERE nombre LIKE '%".$q."%' OR  apellido LIKE '%".$q."%' OR DNI LIKE '%".$q."%' OR fecha LIKE '%".$q."%' ";
            $this->db->set_charset('utf8');
            $result=$this->db->query($query);
            $array=array();

            while($re=$result->fetch_array()){
                $array[]=$re;
            } 
        return $array;

        }

        if(isset($valor)){
        
        $this->db->close();
    }else{

    }
}

    public function dni_clientes(){

        $sql="SELECT DNI FROM usuario";
        $sql = mysqli_query($this->db,$sql);
        $sqll= $sql->fetch_assoc();
        $array=array();
        while ($sqll = mysqli_fetch_assoc($sql)){
    
         $array[]=$sqll['DNI'];
        }
        return $array;
    }

    public function tipo_usuario(){
        $id_cliente=$this->getId_cliente();
        $sql="SELECT ID_TIPO FROM usuario WHERE DNI = $id_cliente";
        $sqll = mysqli_query($this->db,$sql);
        $id_tipo = $sqll->fetch_object();
        //var_dump( $usuario);
        return $id_tipo;
    }

    public function registro_cliente(){
        $id_cliente=$this->getId_cliente();
       // var_dump($id_cliente);
        $sql="SELECT (u.nombre) as 'nombre', u.apellido, DATE_FORMAT(p.fecha_vencimiento, '%d-%m-%Y') AS fecha_vencimiento FROM usuario u JOIN pago p ON u.ID_USUARIO = p.ID_USUARIO WHERE u.DNI = $id_cliente";

        $sqlId = $this->db->query($sql);
       
        $Id = $sqlId->fetch_object();

        // if($sqlId && $sqlId->num_rows==1){

        //     $Id = $sqlId->fetch_object();
           
        //     if($Id){
        //         $result=$Id;
        //     }else{
        //         $result="Errooorr";
        //     }
        // }
        //var_dump($Id);
        return $Id;
    }

    public function registro_empleado(){
        $id_cliente=$this->getId_cliente();

        $sql="SELECT (u.nombre) as 'nombre', u.apellido FROM usuario u WHERE u.DNI = $id_cliente";

        $sqlId = $this->db->query($sql);
       
        if($sqlId && $sqlId->num_rows==1){

            $Id = $sqlId->fetch_object();
           
            if($Id){
                $result=$Id;
            }else{
                $result="Errooorr";
            }
        }
        return $result;
    }


   


    public function registrar_entrada(){
        $id_cliente=$this->getId_cliente();

        $sql1="SELECT ID_USUARIO FROM `usuario` WHERE DNI = $id_cliente";
        $id=$this->db->query($sql1);
        $id_usuario=$id->fetch_object();
        $sql="INSERT INTO `registro_e_s` (`ID_REGISTRO_E_S`, `ID_USUARIO`, `ID_PAGO`, `fecha`, `hora_entrada`, `hora_salida`, `estado`, `fechavenc`) VALUES (NULL, $id_usuario->ID_USUARIO, NULL, now(), now(), null, '1', NULL);";
        $this->db->query($sql);
        echo mysqli_error($this->db);
    }
    public function registrar_salida(){
        $id_cliente=$this->getId_cliente();

        $sql1="SELECT ID_USUARIO FROM `usuario` WHERE DNI = $id_cliente";
        $id=$this->db->query($sql1);
        $id_usuario=$id->fetch_object();

        $sql1="SELECT ID_REGISTRO_E_S FROM registro_e_s WHERE ID_USUARIO =$id_usuario->ID_USUARIO ORDER BY ID_REGISTRO_E_S DESC LIMIT 1";
        $id_registro=$this->db->query($sql1);
        $Id = $id_registro->fetch_object();

        $hora_actual=date('H:i');
        $sql="UPDATE `registro_e_s` SET `hora_salida` = now(), `estado`= '0' WHERE `registro_e_s`.`ID_REGISTRO_E_S` = $Id->ID_REGISTRO_E_S";
        $this->db->query($sql);
        
    }
    public function estado(){
        $a= (object) array('estado'=>0);
       
        $id_cliente=$this->getId_cliente();
        
        $sql1="SELECT ID_USUARIO FROM `usuario` WHERE DNI = $id_cliente";
        $id=$this->db->query($sql1);
        $id_usuario=$id->fetch_object();
 
     

        $sql="SELECT estado FROM registro_e_s WHERE ID_USUARIO = $id_usuario->ID_USUARIO ORDER BY ID_REGISTRO_E_S DESC LIMIT 1";
        $estado=$this->db->query($sql);     
       

        if($estado && $estado->num_rows==1){
            $result = $estado->fetch_object();
        }else{$result=$a;}
       
        return $result;
    }
}