 <?php if (!isset($_SESSION['identity'])):?> 
          
          <?php else: ?>
            <div class="container">
               <div class="row justify-content-center">
                  <div class=' col-3'>
                     <?php if($_SESSION['identity']->sexo =='h'):?>
                        <img src="<?=base_url?>assets/img/hombre.png" class="rounded " alt="">
                     <?php else:  ?>
                        <img src="<?=base_url?>assets/img/mujer.png" class="rounded " alt="">
                     <?php endif;?>
                  </div>
                  <div class='col-3'>
                     <h3>BIENVENIDO: <?= $_SESSION['identity']->nombre?></h3> 
                     <h4>TIPO DE USUARIO: <?= $_SESSION['identity']->tipo?></h4>
                  </div>  
               </div>
               <div class="row justify-content-center" style="margin-top:20px;"><h5>Datos personales</h5></div>
               <div class="row justify-content-center">
                  <div class='col-3 '>
                  <label for="">Nombre: </label>
                     <input type="text"value="<?= $_SESSION['identity']->nombre?>" disabled>
                     <label for="">Apellido: </label>
                     <input type="text"value="<?= $_SESSION['identity']->apellido?>" disabled>
                     <label for="">Email: </label>
                     <input type="text"value="<?= $_SESSION['identity']->email?>" disabled>
                  </div>
                  <div class='col-3'>
                  <label for="">DNI: </label>
                     <input type="text"value="<?= $_SESSION['identity']->DNI?>" disabled>
                     <label for="">Telefono: </label>
                     <input type="text"value="<?= $_SESSION['identity']->telefono?>" disabled>
                     <label for="">Dirección: </label>
                     <input type="text"value="<?= $_SESSION['identity']->direccion?>" disabled>
                  </div>
               </div>
               <div class="row justify-content-center " style="margin-top:30px;">
                  <div class="alert alert-warning col-6 text-center" role="alert">Si desea modificar sus datos póngase en contacto con nuestros recepcionistas, en los horarios de 08:00 hs a 22:00 hs al Tel: 341-3183130 / 4558017 Email: tigergym@gmail.com</div>
               
               </div>
            </div> 
             <?php endif;?> 
        </div>
        </div>
        
        </div>