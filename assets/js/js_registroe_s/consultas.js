mostrar_datos();
function mostrar_datos(){

    jQuery.ajax({            
        url: "http://localhost/master_php/Proyecto_p_p/registro/registro_tabla",
        type:'POST',
        //dataType:'json',
        //data:{consulta:consulta},
        beforeSend: function(){
        }
    })
    .done(function(respuesta){
        console.log(respuesta);
       if(respuesta === []){
        console.log('vacio');
       }
           var resp = JSON.parse(respuesta || '{}');
            console.log(resp);
            html= "<table class='table table-hover'><thead class='thead-dark'> <tr><td>Nombre</td><td>Apellido</td><td>DNI</td><td>Fecha</td><td>Hora Entrada</td><td>Hora Salida</td></tr></thead><tbody>";
            for(var i in resp){
                html+="<tr><td>"+resp[i].nombre+"</td><td>"+resp[i].apellido+"</td><td>"+resp[i].DNI+"</td><td>"+resp[i].fecha+"</td><td>"+resp[i].hora_entrada+"</td><td>"+resp[i].hora_salida+"</td></tr>";
            }
            html+="</tbody></table>"
            $("#datos").html(html);      
    })
    .fail(function(resp){

    console.log('fail');
    })
    .always(function(){
       // console.log("complete");
    });

}

function buscar_datos(consulta){  
    jQuery.ajax({            
        url: "http://localhost/master_php/Proyecto_p_p/registro/registro_c",
        type:'POST',
        //dataType:'json',
        data:{consulta:consulta},
        beforeSend: function(){
        }
    })
    .done(function(respuesta){
        console.log(respuesta);
       if(respuesta === []){
        console.log('vacio');
       }
           var resp = JSON.parse(respuesta || '{}');
            console.log(resp);
            html= "<table class='table table-bordered'><thead> <tr><td>Nombre</td><td>Apellido</td><td>DNI</td><td>Fecha</td><td>Hora Entrada</td><td>Hora Salida</td></tr></thead><tbody>";
            for(var i in resp){
                html+="<tr><td>"+resp[i].nombre+"</td><td>"+resp[i].apellido+"</td><td>"+resp[i].DNI+"</td><td>"+resp[i].fecha+"</td><td>"+resp[i].hora_entrada+"</td><td>"+resp[i].hora_salida+"</td></tr>";
            }
            html+="</tbody></table>"
            $("#datos").html(html);      
    })
    .fail(function(resp){

    console.log('fail');
    })
    .always(function(){
       // console.log("complete");
    });
}

$(document).on('keyup','#caja_busqueda',function(){

    var valor=$(this).val();

    if(valor != ""){
        buscar_datos(valor);
    }else{
        //alert(valor);
        mostrar_datos()}

});