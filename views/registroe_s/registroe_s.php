<?php require_once 'controllers/RegistroController.php';?>
<?php ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- <link rel="stylesheet" href="<?=base_url?>assets/css/bootstrap/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="<?=base_url?>assets/css/registroe_s/styleregistroe_s.css">
    <link rel="stylesheet" href="<?=base_url?>assets/css/registroe_s/fontawesome.css">
    <title>TIGUER GYM</title>
</head>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="<?=base_url?>registro/registrose_s_consulta">CONSULTAS</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-success" href="<?=base_url?>admin/index">SALIR</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- fin Navbar -->
    <!--Contenido Central-->    
    <div class="login">

        <!-- Imagen login-->
        <div class="container-fluid slider d-flex justify-content-center align-items-center">     
        </div>
        <!-- fin Imagen login-->
        <div class='row'>
            <div class='col-sm '>
                <div class="row">
                    <video id="preview"></video>
                </div>
                
                <script>
                    document.addEventListener("DOMContentLoaded", event => {
                        let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
                        Instascan.Camera.getCameras().then(cameras => {
                            scanner.camera = cameras[cameras.length - 1];
                            scanner.start();
                        }).catch(e => console.error(e));

                        scanner.addListener('scan', content => {
                           
                            console.log(content);
                            var a = content;
                            $('#resp').val(a);
                            $('#boton').click();                                                        
                        });
                    });       
                </script>
                <div class='row' id="respuesta">
                    <form  id="res" name="res" method="POST">
                        <input type="text" name="resp" id="resp" placeholder="Ingresar DNI" required autofocus>
                        <input class="btn btn-primary" id="boton" type="submit" value="INGRESAR" >
                    </form>
                </div>
                <div class="row" id="entro" style="display:none" >ENTRÓ<img src="<?=base_url?>assets/img/Enter_41039.ico" alt="" ></div>
                <div class="row" id="salio" style="display:none">SALIÓ<img src="<?=base_url?>assets/img/Exit_41038.ico" alt="" ></div>
            </div>
            
            <div class='col-sm'>
                <div class='row' id="fecha"></div>
                <div class='row' id="reloj"></div>
                
                <div class='row' id="datosUsuario" style="display:none">                    
                        <label id='nombre' ></label>
                        <label id='apellido' ></label>                  
                </div>

                <div class="row" id='fechav'>
                     <label id='fechavenc' ></label>
                </div>

                <div id="imagen"><img src="<?=base_url?>assets/img/img_index/logo.png" alt="">
                </div>

                <div class="row " id="dniInvalido" style="display:none">
                    <p><i class="fa fa-times-circle rojo"></i> NO INGRESAR</p>
                </div>

                <div class="row " id="dniValido"  style="display:none">
                    <p><i class="fa fa-check-circle verde"></i> OK</p>
                </div>
            </div> 
    </div>
    </div>
    <!--FIN Contenido Central-->
    <!-- <script src="<?=base_url?>assets/js/js_bootstrap/jquery-3.4.1.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="<?=base_url?>assets/js/js_registroe_s/registroe_s.js"></script> 
    <script src="<?=base_url?>assets/js/js_registroe_s/all.js"></script> 
    <script src="<?=base_url?>assets/js/js_registroe_s/instascan.js"></script>
    <script src="<?=base_url?>assets/js/js_registroe_s/qrcode.js"></script>
</body>
</html>