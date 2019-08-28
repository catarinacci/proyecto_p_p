
$(document).ready(function(){
    $(window).scroll(function(){
        if($(this).scrollTop() > 100){
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").addClass('btn-outline-success');
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").removeClass('btn-success');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").addClass('btn-outline-primary');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").removeClass('btn-primary'); 
            $(".navbar").addClass('navbar-dark bg-dark');
            $(".navbar").removeClass(' navbar-light'); 
        }else{
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").removeClass('btn-outline-success');
            $("#navbarSupportedContent > ul > li:nth-child(5) > a").addClass('btn-success');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").removeClass('btn-outline-primary');
            $("#navbarSupportedContent > ul > li:nth-child(4) > a").addClass('btn-primary');
            $(".navbar").removeClass('navbar-dark bg-dark');
            $(".navbar").addClass('navbar-light'); 
            
        }
    });
   
     
     function mediaquery(){
        if(window.matchMedia('(min-width: 908px)').matches){
            $("#carouselExampleIndicators > div > div > img").addClass('w-100');
        }else{
            $("#carouselExampleIndicators > div > div > img").removeClass('w-100');
        }
            
    };
    mediaquery();
    window.addEventListener('resize',mediaquery, false); 

    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        pagination:false,
        autoplay:1000,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:5
            }
        }
    })
});
