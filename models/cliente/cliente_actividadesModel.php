<?php

class clienteActividades{
    
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

    public function cliente_actividades(){
        $error='Error consulta';
        $id=$this->getId_cliente();
       
        $sql_actividades="SELECT a_u.ID_ACTIVIDAD, a.nombre_actividad, A.precio_actividad, CONCAT(u.nombre,' ', u.apellido)AS 'Nombre instructor' FROM actividad_usuario a_u JOIN actividad a ON a_u.ID_ACTIVIDAD = a.ID_ACTIVIDAD LEFT JOIN usuario u ON u.ID_USUARIO = a.ID_USUARIO_INSTRUCTOR WHERE a_u.ID_USUARIO = '$id' ";
        $actividades = mysqli_query($this->db,$sql_actividades);
        if($actividades){

            $result=$actividades;

        }else{
            $result=$error;
        }
        // var_dump($result);
        //  die();
        return $result;
       
    }

    public function actividad_horario($id_act){
        $error='Error consulta';
        $idact=$id_act;
        // var_dump($idact);
        // die();
        $sql_horario="SELECT d.nombre_dia as Día, h.hora_entrada AS 'Hora inicio', h.hora_salida AS 'Hora salida' FROM horario h JOIN actividad a ON a.ID_ACTIVIDAD=h.ID_ACTIVIDAD JOIN dia d ON d.ID_DIA = h.ID_DIA WHERE a.ID_ACTIVIDAD = '$idact'";
        $horario = mysqli_query($this->db,$sql_horario);
        if($horario){

            $result=$horario;

        }else{
            $result=$error;
        }
        
        return $result;
         
    }
    public function pago(){
        $error='Error consulta';
        $id=$this->getId_cliente();

        $sql_pago="SELECT monto, DATE_FORMAT(fecha_vencimiento,'%a - %D-%M-%Y') as fecha_vencimiento FROM pago WHERE ID_USUARIO = '$id'";
        $pago = mysqli_query($this->db,$sql_pago);
        $pago_obj=$pago->fetch_object();
        if($pago_obj){

            $result=$pago_obj;

        }else{
            $result=$error;
        }
        
        return $result;
    }
}

?>
