<?php
require_once 'models/cliente/cliente_actividadesModel.php';
    class clienteController{
        public function index(){
            require_once 'views/cliente/cliente.php';
        }
        public function mis_actividades(){
             require_once 'views/cliente/cliente_actividades.php';
            $actividades=new clienteActividades;
            
            $actividades->setId_cliente($_SESSION['identity']->ID_USUARIO);
            $act_clientes=$actividades->cliente_actividades();
            
            return $act_clientes;
            //   var_dump ($act_clientes);
            //   die();
         }
         public function pago(){
             $pago= new clienteActividades;
             $pago->setId_cliente($_SESSION['identity']->ID_USUARIO);
             $pago_cli=$pago->pago();
             return $pago_cli;
              //var_dump ($pago_cli);
               //die();
         }
         public function horarios_actividades($id_act){
            $horario= new clienteActividades;
            // $horario->setId_cliente($_SESSION['identity']->ID_USUARIO);
            // $act=$horario->cliente_actividades();
            // var_dump ($act);
            // die();

            $val=$id_act;
            $horario_act = $horario->actividad_horario($val);
            
            // var_dump ($horario_act);
            //    die();

            return $horario_act;
         }
    }
// $act_usu=new clienteController();
// $resut=$act_usu->mis_actividades();