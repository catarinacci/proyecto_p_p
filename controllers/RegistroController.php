<?php
require_once 'models/registroe_s/registroe_sModel.php';
class registroController{
    public function index(){
        
        require_once 'views/registroe_s/registroe_s.php';
        // var_dump($_POST); echo $variable=($_POST)?"ExisteController":"noexisteController";
         
    }
    public function registro(){
        
       if(isset($_POST['resp'])){

        // $array = array( $_POST['resp']=>'entró');
        // var_dump($array);
        // echo
        // die();
        //var_dump( $array);

        $regitro= new registrosUsuarios;
        $regitro->setId_cliente($_POST['resp']);
        $result=$regitro->registro();
        echo json_encode(array('nombre'=> $result->nombre, 'apellido' => $result->apellido, 'fecha'=>$result->fecha_vencimiento));
    //    var_dump($result);
    //    echo $result->nombre;
    //      die();
        return $result;
       }else{

       echo"No existe";}
    }
}