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
    <link rel="stylesheet" href="<?=base_url?>assets/css/menu/stylemenu.css">
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
                <a class="nav-link" href="#">ACTIVIDADES</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">CUENTA DE USUARIOS</a>
                </li>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">PAGOS</a>
                </li>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">REGISTROS E/S</a>
                </li>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">CONSULTAS</a>
                </li>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">REPORTES</a>
                </li>
                <li class="nav-item">
                <a class="btn btn-success" href="<?=base_url?>login/logout">SALIR</a>
                </li>
            </ul>
            </div>
        </div>
        </nav>
        <!-- fin Navbar -->
         <!-- Imagen login-->
         <div class="login">
         <div class="container-fluid slider d-flex justify-content-center align-items-center">
        <!-- fin Imagen login-->
       <?php require_once 'layout/contcentral.php';
             require_once 'layout/footer.php';
        ?>