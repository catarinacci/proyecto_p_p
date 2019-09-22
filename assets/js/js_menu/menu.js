$(document).ready(function(){
    /* Cambio de transparente a color sólido menú */
    $(window).scroll(function(){
        if($(this).scrollTop() > 100){ 
            $(".navbar").addClass('navbar-dark bg-dark');
            $(".navbar").removeClass(' navbar-light'); 
        }else{
             $(".navbar").removeClass('navbar-dark bg-dark');
            $(".navbar").addClass('navbar-light'); 
            
        }
    });
});