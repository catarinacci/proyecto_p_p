$(document).ready(function(){
    
        $(".btn").click(function(e){
            
            e.preventDefault();
            var btn = this.id.split('_');
            var fmr=$(this).serialize();
            var val = this.value.split('_');      
                
            console.log(btn+"aaaaa");
            
            console.log(btn);
            console.log(val[0]);
            if(val[0]=="ver"){
                $('.'+btn).show();
                $('#'+btn+'ocultar').show();
                $('#'+btn).hide();}
             
             if(val[0]=="ocultar"){
                 var btn1=btn[0];
                 var a ="ocultar";
                 var b ="";
                 var btn= btn1.replace(a,b);
                 
                 $('#'+btn).show();
                 $('#'+btn+'ocultar').hide();
                 $('.'+btn).hide();
                 
                
              }
            
            });
   
});