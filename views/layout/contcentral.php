 <?php if (!isset($_SESSION['identity'])):?> 
          
          <?php else: ?>
             <h3>NOMBRE USUARIO: <?= $_SESSION['identity']->nombre?></h3> 
             <h4>TIPO DE USUARIO: <?= $_SESSION['identity']->ID_TIPO?></h4> 
          <?php endif;?> 
        </div>
        </div>
        
        </div>