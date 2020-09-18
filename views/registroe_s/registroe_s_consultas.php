<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registros E/S </title>
    <!-- <link rel="stylesheet" href="<?=base_url?>assets/css/bootstrap/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="<?=base_url?>assets/css/registroe_s/styleconsultas.css">
</head>
<body>

    <div class="principal" id="principal" >
    <a class="btn btn-primary"align="left" href="<?=base_url?>registro/index">VOLVER</a>
        <h1 align="center" >Regitros de Entradas y Salidas</h1>
        <div class="form-1-2">
            <label for="caja_busqueda">Buscar</label>
            <input type="text" class="form-control" name="caja_busqueda" id="caja_busqueda">
        </div>
        <div id="datos">
        </div>
</div>

    <!-- <script src="<?=base_url?>assets/js/js_bootstrap/jquery-3.4.1.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="<?=base_url?>assets/js/js_registroe_s/consultas.js"></script> 
</body>
</html>