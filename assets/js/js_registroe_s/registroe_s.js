
$(document).ready(function(){
  
      jQuery(document).on('submit','#res',function(event){
        event.preventDefault();
        var fmr=$(this).serialize();
        //var fmr = $('#res').serialize();
        //var fmr1 = $('#resp1').val();
        //console.log(fmr + '/ajax');
        jQuery.ajax({
            
            url: "http://localhost/master_php/Proyecto_p_p/registro/registro",
            type:'POST',
            //dataType:'json',
            data:fmr,
            beforeSend: function(){
              $('#resp').val('aaaaaaaaaaaaaaaaaaa')
            }
        })
        .done(function(respuesta){
          var a = JSON.parse(respuesta || '{}');
          console.log(a.nombre + a.apellido + a.fecha);
            $('#nombre').text(a.nombre);
            $('#apellido').text(a.apellido);
            $('#fechavenc').text(a.fecha);
            console.log(respuesta);
            console.log('done');
            
        })
        .fail(function(resp){

          console.log('fail');
        })
        .always(function(){
            console.log("complete");
        });
      });

  /*Fecha y Hora*/
   var d =new Date();
   var m= d.getMonth() + 1;
   var mes = (m < 10) ? '0' + m : m;
   var mes = new Array(12);
   mes[0]="Enero";
   mes[1]="Febrero";
   mes[2]="Marzo";
   mes[3]="Abril";
   mes[4]="Mayo";
   mes[5]="Junio";
   mes[6]="Julio";
   mes[7]="Agosto";
   mes[8]="Septimbre";
   mes[9]="Octubre";
   mes[10]="Noviembre";
   mes[11]="Diciembre";
   var dia=new Array(7);
   dia[0]="Domingo";
   dia[1]="Lunes";
   dia[2]="Martes";
   dia[3]="Miércoles";
   dia[4]="Jueves";
   dia[5]="Viernes";
   dia[6]="Sábado";
   document.getElementById('fecha').innerHTML="Hoy es  " + dia[d.getDay()]+" "+ d.getDay() +" " + mes[d.getMonth()]+" del "+ d.getFullYear();

   function startTime(){
      var tiempo=new Date();
      var hora =tiempo.getHours();
      var minuto =tiempo.getMinutes();
      var segundo =tiempo.getSeconds();
      
      var exhora;
      var horacompleta;
      
      if(minuto < 10){
        minuto = "0" + minuto;
      }else{
        minuto = "" + minuto;
      }
      if(segundo < 10){
        segundo = "0" + segundo;
      }else{
        segundo = "" + segundo;
      }
      if(hora > 12){
        exhora = "AM";
      }else{
        exhora = "PM";
      }
      if(hora > 12){
        hora -= 12;
      }else{
        hora = hora;
      }
      if(hora == 0){
        hora = 12;
      }else{
        hora = hora;
      }
      horacompleta= hora + ":" + minuto + ":" + segundo + "  " + exhora;
      $("#reloj").html(horacompleta);
    }

    setInterval(startTime, 1000);
    window.onload=function(){startTime;}
    /* FIN Fecha y Hora*/


});