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
//= require cocoon
//= require select2
//= require jquery.maskedinput
//= require tooth_logic
// Turbolinks.enableTransitionCache();


// Function to disable events
/*
 $("#nonx").click(function (event) {
 return false;
 });
* */





$(document).ready(function(){

    $('.collapsible').collapsible({
    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
        });
});


/*JS pending refactoring*/

(function() {
    $(".phone-mask").mask("(999) 999-9999");
    $("#e1").select2();
    $('#e1').select2({
        language: {
            noResults: function() {
                return "Cliente no encontrado.  <a href='/clients/new'>Desea crearlo?</a>";
            }
        },
        escapeMarkup: function(markup) {
            return markup;
        }
    });
})();

(function() {
  $('.datepicker').pickadate({
        format: 'yyyy-mm-dd',
        //set today the min date
        min: true,
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
        labelYearSelect: 'Seleccionar Año'



      });
})();


function printpage(){
     window.print()
  }
$( document ).ready(function(){

  $(function() {
      Materialize.updateTextFields();
  });
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('.tooltipped').tooltip({delay: 25});
  $('ul.tabs').tabs();
  $('input#input_text, textarea#textarea1').characterCounter();
  $('.modal-trigger').leanModal();

  //Datepicker withou date restriction
  $('.datepicker_all').pickadate({
    format: 'yyyy-mm-dd',
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
    labelYearSelect: 'Seleccionar Año'



  });
  $(".tabfactura").click(function() {
    document.getElementById("invoice_tab").className = document.getElementById("invoice_tab").className.replace(/\bdisabled\b/,'');
    $('ul.tabs').tabs('select_tab', 'test2');

  });
  $(".tabfactura_back").click(function() {
    $('ul.tabs').tabs('select_tab', 'test1');

  });



  /*Changes Order Date to disabled and clear date if exist*/
  $("#sale_coti").click(function() {
            if (this.checked == true) {
              document.getElementById("sale_order_date").disabled = "disabled";
              document.getElementById("sale_order_date").value = "";
            }
            else{
              document.getElementById("sale_order_date").disabled = "";
             }
      });

$(function(){
    $('a[data-reload="true"').on('click', function(e) {

        var delay=1000;
        setTimeout(function() {
         window.location = $(e.target).attr('href');
          window.location.reload(true);
        }, delay);

    });
});

});
