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
