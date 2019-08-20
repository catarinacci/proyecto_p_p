
$(document).ready(function(){
    $(window).scroll(function(){
        if($(this).scrollTop() > 100){
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").addClass('btn-outline-success');
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").removeClass('btn-success');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").addClass('btn-outline-primary');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").removeClass('btn-primary'); 
            $(".navbar").addClass('navbar-dark bg-dark');
            $(".navbar").removeClass('navbar-light'); 
        }else{
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").removeClass('btn-outline-success');
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").addClass('btn-success');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").removeClass('btn-outline-primary');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").addClass('btn-primary');
            $(".navbar").removeClass('navbar-light bg-dark');
            $(".navbar").addClass('navbar-light'); 
        }
    });
});