<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- All CSS -->
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="<?=base_url?>assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<?=base_url?>assets/css/login/stylelogin.css">
    <script src="https://kit.fontawesome.com/e55edbd839.js"></script>
    <title>TIGER GYM</title>

  <body>
  <div class="error flex-center " style="display: none">
            <span>Datos no válidos, inténtalo nuevamente...</span>
  </div>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="<?=base_url?>">
            <img src="<?=base_url?>assets/img/img_index/logo.png" width="60" height="50" class="d-inline-block align-top" alt="">
                TIGER GYM
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                <a class="nav-link" href="<?=base_url?>">INICIO</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">ACTIVIDADES</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">CONTACTO</a>
                </li>
                <!-- <li class="nav-item">
                <a class="btn btn-success" href="<?=base_url?>login/logout">SALIR</a>
                </li> -->

            </ul>
            </div>
        </div>
        </nav>
        <!-- fin Navbar -->
         <!-- Imagen login-->
         <div class="login">
         <div class="container-fluid slider d-flex justify-content-center align-items-center">
          <!-- fin Imagen login-->
          
          <?php if (!isset($_SESSION['identity'])):?> 
           <!--Formulario login-->
          <form  name="formlogin" id="formlogin" method="POST">
            <div class="formulario">
              <div class="form-group">
                <label for="exampleInputEmail1">Dirección de Correo.</label>
                <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Ingrese su Correo" required>
                <small id="emailHelp" class="form-text text-muted">Nunca compartiremos su correo electrónico con nadie más.</small>
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Contraceña.</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Contraceña" minlength="4" maxlength="8" required>
              </div>
              <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Recordarme</label>
              </div>
            </div>
            <input type="submit" name="login" id="loginBtn" class="btn btn-primary" value="Ingresar"/>
          </form>
          <?php else: ?>
             <h3><?= $_SESSION['identity']->nombre?></h3> 
          <?php endif;?> 
        </div>
        </div>
       
        </div>
        <!-- Footer -->
        <footer class="page-footer font-small blue darken-3S">

            <!-- Footer Elements -->
            <div class="container">

            <!-- Grid row-->
            <div class="row">

                <!-- Grid column -->
                <div class="col-md-12 py-5" >
                <div class="mb-5 flex-center text-center">

                    <!-- Facebook -->
                    <a class="fb-ic" href="">
                        <i class="fab fa-facebook-square fa-lg white-text text-primary mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic" href="">
                        <i class="fab fa-instagram fa-lg white-text text-warning mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic" href="">
                        <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic" href="">
                        <i class="fab fa-google-plus-g fa-lg white-text text-danger mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic" href="">
                        <i class="fab fa-linkedin-in fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    
                    <!--Pinterest-->
                    <a class="pin-ic" href="">
                        <i class="fab fa-pinterest fa-lg white-text text-danger fa-2x"> </i>
                    </a>
                </div>
                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row-->

            </div>
            <!-- Footer Elements -->

            <!-- Copyright -->
            <div class="copy" style="background: black; color:white;">
                <div class="footer-copyright text-center py-3">© 2019 Copyright:
                    <a href=""> equipodetrabajo.com</a>
                    <p>Tel: 341-3183130 / 4558017 Email: tigergym@gmail.com</p>
                </div>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- fin Footer -->

    <script src="<?=base_url?>assets/js/js_bootstrap/jquery-3.4.1.min.js"></script>
    <script src="<?=base_url?>assets/js/js_login/login.js"></script> 
    <!-- <script src="<?=base_url?>assets/js/js_bootstrap/popper.min.js"></script> -->
    
    <script src="<?=base_url?>assets/js/js_bootstrap/bootstrap.min.js"></script>
   </body>
</html>