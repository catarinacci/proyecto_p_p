$(document).ready(function(){
  //$('.error').hide('fast');
//     $('#formlogin').on('submit',function(e){
//         e.preventDefault();
//         var form=$(this).serialize();
//         console.log(form);
//     })
  });

  jQuery(document).on('submit','#formlogin',function(event){
    event.preventDefault();
    var fmr=$(this).serialize();
    //console.log(fmr);
    jQuery.ajax({
       url:'http://localhost/master_php/Proyecto_p_p/login/login',
        //url:'http://localhost/master_php/Proyecto_p_p/models/login/LoginModel.php',
        type:'POST',
        //dataType: 'json',
        data:fmr,
        beforeSend: function(){
          $('#loginBtn').val('Validando...');
          $('#loginBtn').addClass('btn btn-warning');
        }
    })
    .done(function(respuesta){
        console.log('eee');
        console.log(respuesta);
        var a = JSON.parse(respuesta || '{}');
        console.log(a.error);
        
        if(! a.error){
          if(a.tipo == 'admin'){
            console.log('entro');
            location.href = 'http://localhost/master_php/Proyecto_p_p/admin/index';
          }else if(a.tipo == 'recepcionista'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/recepcionista/index';
          }else if(a.tipo == 'mantenimiento'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/mantenimiento/index';
          }else if(a.tipo == 'rrhh'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/rrhh/index';
          }else if(a.tipo == 'tesoreria'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/tesoreria/index';
          }else if(a.tipo == 'marketing'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/marketing/index';
          }else if(a.tipo == 'instructor'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/instructor/index';
          }else if(a.tipo == 'cliente'){
            location.href = 'http://localhost/master_php/Proyecto_p_p/cliente/index';
          }
        }else{
          $('.error').slideDown('slow');
          setTimeout(function(){
            $('.error').slideUp('slow');
            
          }, 3000);
          $('#loginBtn').val('Ingresar');
          $('#loginBtn').removeClass(' btn-warning');
        }
   })
    .fail(function(resp){

      console.log('aaaaaaaS');
      //console.log(resp);
      console.log(resp.responseText);
    })
    .always(function(){
        console.log("complete");
    });
});
    
    // function login(){
    //   var email = $('form[name=formlogin] input[name=email]')[0].value;
    //   var password = $('form[name=formlogin] input[name=password]')[0].value;
   
     
    //   $.ajax({
    //     type:"POST",
    //     url:"http://localhost/master_php/Proyecto_p_p/login/login",
    //     data:{email: email, password: password}
    //   })
    //   done(function(response){
    //       console.log(data);
    //     if(response == 1){
    //        alert("Datos enviados");

    //     }else{
    //        alert("Email o Contraceña incorrecto");
    //     }
    //   });
    
    // }
