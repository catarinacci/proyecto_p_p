<?php require_once 'controllers/ClienteController.php';?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- All CSS -->
    <!-- Bootstrap core CSS -->
    <!-- <link rel="stylesheet" href="<?=base_url?>assets/css/bootstrap/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="<?=base_url?>assets/css/cliente_actividad/stylecliente_actividad.css">
    
    <script src="https://kit.fontawesome.com/e55edbd839.js"></script>
    <title>TIGER GYM</title>

  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="">
            <img src="<?=base_url?>assets/img/img_index/logo.png" width="60" height="50" class="d-inline-block align-top" alt="">
                TIGER GYM
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                <a class="btn1 btn-success" href="<?=base_url?>cliente/index">VOLVER</a>
                </li>
            </ul>
            </div>
        </div>
        </nav>
        <!-- fin Navbar -->
         <!-- Imagen login-->
        <div class="login d-flex">
         <div class="container d-flex justify-content-center align-items-center">
        <!-- fin Imagen login-->
        <div class="row1 d-flex flex-row  ">
         
      <form name="formactividades" id="formactividades" method="POST">
       <table class="table table-responsive ">
         <thead class="thead-dark">
            <tr>
              <th scope="col">ACTIVIDAD</th>
              <th scope="col">PRECIO</th>
              <th scope="col">INSTRUCTOR</th>
              <th scope="col">HORARIO</th>
            </tr>
         </thead>
         <tbody id="datos">
            <?php
            
            $act_usu=new clienteController;

            $actividades= $act_usu->mis_actividades();
            
            
            foreach($actividades as $row){?>

            <tr>
              <td><?php echo $row['nombre_actividad'];?></td>
              <td><?php echo "$".$row['precio_actividad'];?></td>
              <td><?php echo $row['Nombre instructor'];?></td>
              <td>
                <!-- Button -->
            
                <button type="submit" value="ver"id="<?php echo $row['nombre_actividad'];?>" class="btn btn-primary" >
                  Ver horarios
                </button>
                <input type="text" name="<?php echo $row['ID_ACTIVIDAD'];?>" value="<?php echo $row['ID_ACTIVIDAD'];?>" style="display:none">
                
                <?php
                if($_POST){
                 $val=$_POST[$row['ID_ACTIVIDAD']];
                 echo json_encode(array('error'=> false, 'tipo' => $val));
                }else{
                  $val=$row['ID_ACTIVIDAD'];
                }?>
                
                  <?php $hora_act=new clienteController;
                            
                            if($val){
                              $horario= $hora_act->horarios_actividades($val);
                                  }?>  
                   <!-- Tabla Horarios-->
                    <div class="<?php echo $row['nombre_actividad']?>" id="" style="display:none">
                      <table class="table table-responsive ">
                    <thead class="thead-dark">
                        <tr>
                          <th scope="col">DÍA</th>
                          <th scope="col">ENTRADA</th>
                          <th scope="col">SALIDA</th>
                        </tr> 
                    </thead>
                    <tbody id="datos">
                        <?php
                        foreach($horario as $row2){?>

                        <tr>
                          <td><?php echo $row2['Día'];?></td>
                          <td><?php echo $row2['Hora inicio'];?></td>
                          <td><?php echo $row2['Hora salida'];?></td>
                        </tr>
                        
                    </tbody>
                        <?php }?> 

                  </table>
                  </div>

                <button type="button" value="ocultar" id="<?php echo $row['nombre_actividad'];?>ocultar"  class="btn btn-warning" style="display:none" >
                  Ocultar horarios
                </button>
            </td>
            </tr>
            
         </tbody>
             <?php }?> 
       </table>
       </form>
        </div>
        
       </div>
        <div class="container d-flex justify-content-center align-items-center">
        <div class="row2 d-flex flex-row">
        
        <table class="table table-responsive ">
         <thead class="thead-dark">
            <tr>
              <th scope="col">PRECIO CUOTA</th>
              <th scope="col">FECHA DE VENCIMIENTO</th>
            </tr>
         </thead>
         <tbody id="datos">
            <?php
            $pago_usu=new clienteController;

            $pago= $pago_usu->pago();
            
            // var_dump($pago);
            // die();
            ?>
            
          
            <tr>
              <td><?php echo "$". $pago->monto;?></td>
              <td><?php echo $pago->fecha_vencimiento;?></td>
            </tr>
            
         </tbody>
            
          </table>
            </div>
            
       </div> 
      
       
       <!-- <footer>
        Copyright 
<div class="copy" style="background: black; color:white;">
    <div class="footer-copyright text-center py-3">© 2019 Copyright:
        <a href=""> equipodetrabajo.com</a>
        <p>Tel: 341-3183130 / 4558017 Email: tigergym@gmail.com</p>
    </div>
</div>
Copyright
</footer> -->
       <!-- <script src="<?=base_url?>assets/js/js_bootstrap/jquery-3.4.1.min.js"></script> -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
       <script src="<?=base_url?>assets/js/js_cliente_actividad/js_cliente_actividades.js"></script>
<script src="<?=base_url?>assets/js/js_menu/menu.js"></script> 
<!-- <script src="<?=base_url?>assets/js/js_bootstrap/bootstrap.min.js"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>