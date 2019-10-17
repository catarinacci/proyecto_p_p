 
        
        
        
 <?php if (!isset($_SESSION['identity'])):?> 
          
          <?php else: ?>
             <div class="container justify-content-center "> 
             <div class="card-group row justify-content-center container-fluid">
               <div class="card col-xg-4 text-center ">
                  <?php if($_SESSION['identity']->sexo =='h'):?>
                        <img src="<?=base_url?>assets/img/hombre.png" class="card-img-top " alt="">
                     <?php else:  ?>
                        <img src="<?=base_url?>assets/img/mujer.png" class="card-img-top " alt="">
                  <?php endif;?>
                  <div class="card-body">
                     <div class="form-group ">
                           <label for="formGroupExampleInput"><h3>BIENVENIDO</h3></label>
                           <input type="text" class="form-control" id="formGroupExampleInput" placeholder="<?= $_SESSION['identity']->nombre?> <?= $_SESSION['identity']->apellido?>" disabled> 
                     </div>
                     <div class="form-group ">
                           <label for="formGroupExampleInput2">TIPO DE USUARIO</label>
                           <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="<?= $_SESSION['identity']->tipo?>" disabled>
                     </div>
                  </div>
               </div>
               <div class="card col-xg-4 text-center ">
                  <div class="card-body">
                     <div class="form-group ">
                     <div class="row justify-content-center">
                           <label ><h3>DATOS PERSONALES</h3></label>
                     </div>
                           <label for="formGroupExampleInput">DNI</label> 
                           <input type="text" class="form-control" id="formGroupExampleInput" placeholder="<?= $_SESSION['identity']->DNI?>"disabled> 
                     </div>
                     <div class="form-group ">
                           <label for="formGroupExampleInput2">DIRECCIÓN</label>
                           <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="<?= $_SESSION['identity']->direccion?>"disabled>
                     </div>
                     <div class="form-group ">
                           <label for="formGroupExampleInput2">E-MAIL</label>
                           <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="<?= $_SESSION['identity']->email?>"disabled>
                     </div>
                     <div class="form-group ">
                           <label for="formGroupExampleInput2">TELÉFONO</label>
                           <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="<?= $_SESSION['identity']->telefono?>"disabled>
                     </div>
                  </div>
               </div>
                </div> 
             <?php endif;?> 
        </div>
        </div>
        </div>
        <div class='container-fluid' style="background:yellow"></div>