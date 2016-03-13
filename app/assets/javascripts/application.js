// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize/extras/nouislider



$( document ).ready(function(){
	   $(".button-collapse").sideNav();
})


$( document ).ready(function(){
$('.datepicker').pickadate({
	// Strings and translations
	selectMonths: true, // Creates a dropdown to control month
	selectYears: 15, // Creates a dropdown of 15 years to control year
	monthsShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
	monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
	weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	// Buttons
	today: 'Hoy',
	clear: 'Borrar',
	close: 'Cerrar',

	// Accessibility labels
	labelMonthNext: 'Siguiente Mes',
	labelMonthPrev: 'Mes Anterior',
	labelMonthSelect: 'Seleccionar Mes',
	labelYearSelect: 'Seleccionar Año',


});
})




// $(document).ready(function(){

//   function imageSize(){
//     var a = $('div').height();
//     var b = $('page-footer').height();

//     if (a > b){
//       $('div').height(b).width('auto').css('margin-top', 0);
//     } else if (b > a){
//       $('div').width('50%').height('auto').css('margin-top', (b-a)/2);
//     }
//   }

//   $(window).resize(function(){
//     imageSize();
//   });

// });
