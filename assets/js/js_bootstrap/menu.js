$(function() {
    var boton = $('#btn-menu');
    var fondo_enlace = $('#fondo-enlace');

    boton.on('click', function() {
        fondo_enlace.toggleClass('active');
        $('#menu-desplegable').toggleClass('active');
    });

    fondo_enlace.on('click', function() {
        fondo_enlace.toggleClass('active');
        $('#menu-desplegable').toggleClass('active');
    });
}())