<?php
require_once 'models/registroe_s/registroe_sModel.php';
class registroController{
    public function index(){
        
        require_once 'views/registroe_s/registroe_s.php';
         
    }
    public function registro(){

       if(isset($_POST['resp'])){

        $regitro= new registrosUsuarios; 
       
        $a=$regitro->dni_clientes();
        $long=count($a);
         if(in_array($_POST['resp'],$a)){
            
            for($i=0; $i < $long; $i++){
                $a[$i];                               
               }
               $regitro->setId_cliente($_POST['resp']);
               
               $est=$regitro->estado();

               $tipo=$regitro->tipo_usuario();

               
               if($tipo->ID_TIPO == 7){

                    $result=$regitro->registro_cliente();

                    $f_a=date('d-m-Y');
                    $fa=strtotime($f_a);
                    $f1=$result->fecha_vencimiento;
                    $f_v= date($f1);
                    $fv=strtotime($f_v);
                    //$fecha1=date('d-m-Y',$f1);  
                    //$f1=date('d-m-Y',$fecha1);
                    // $f2=strtotime($fecha1);   
                    //$interval=$f_a->diff($f_v);
                    if($fv > $fa){
                        $fecha="vigente";

                        if($est->estado == 0){
                            $regitro->registrar_entrada();
                        }else{
                            $regitro->registrar_salida();
                        }

                    }else{$fecha="vencida";}
                    
                    echo json_encode(array('estadoe_s'=>$est->estado,'estado'=>$fecha ,'tipo'=>$tipo->ID_TIPO,'error'=>'false','nombre'=> $result->nombre, 'apellido' => $result->apellido, 'fecha' => $f_v));
               }else{
                   
                    $result=$regitro->registro_empleado();
                    // var_dump($result);
                    // var_dump($est);
                    echo json_encode(array('estadoe_s'=>$est->estado,'tipo'=>$tipo->ID_TIPO,'error'=>'false','nombre'=> $result->nombre, 'apellido' => $result->apellido));
                    if($est->estado == 0){
                        $regitro->registrar_entrada();
                    }else{
                        $regitro->registrar_salida();
                    }
               }
               
         }else{
            echo json_encode(array('error'=>'true'));
         }
       }else{

        echo json_encode(array('error'=>'true'));}
    }

    public function registrose_s_consulta(){
        
        require_once 'views/registroe_s/registroe_s_consultas.php';     
    }

    public function registro_c(){
        $consulta= new registrosUsuarios;
        
        if(isset($_POST['consulta'])){
            $a=$_POST['consulta'];
            $ad=$consulta->consultas($a);
            echo json_encode($ad);
                
        }else{
            
        }
    }
    public function registro_tabla(){
        $consulta= new registrosUsuarios;
        
        $a=$consulta->mostrar_tabla();
            echo json_encode($a);   
    }
}