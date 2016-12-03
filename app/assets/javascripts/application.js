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

/*GET price functions */


function amount_sum(){
    var worktype_price = Number(document.getElementById('price_worktype').value);
    var material_price = Number(document.getElementById('price_material').value);
    var mcolor_price = Number(document.getElementById('price_mcolor').value);
    var gcolor_price = Number(document.getElementById('price_gcolor').value);
    var procedure_price = Number(document.getElementById('price_procedure').value);
    document.getElementById("service_total_f").value = '';
    var sum = worktype_price + material_price + mcolor_price + gcolor_price + procedure_price;

    document.getElementById("service_total_f").value = sum;
}



$(document).on("change", "select#worktype_store_id", function(e){

    document.getElementById('material_collapse').style.display = "inline";
    document.getElementById('mcolor_collapse').style.display = "inline";
    document.getElementById('gcolor_collapse').style.display = "inline";
    document.getElementById('procedure_collapse').style.display = "inline";


    $.ajax({
        url: "/worktypes/"+$(this).val() ,
        dataType: "json",
        data: { id: $(this).val() },

        success: function(data){
            console.log(data.price);
            var worktype_price = document.getElementById('price_worktype');
            worktype_price.value = data.price;

            if (data.price == undefined) {
            worktype_price.value = 0
            }
            amount_sum();
        }

    });
});

$(document).on("change", "select#material_store_id", function(e){
    $.ajax({
        url: "/materials/"+$(this).val() ,
        dataType: "json",
        data: { id: $(this).val() },
        success: function(data){
            console.log(data.price);
            var material_price = document.getElementById('price_material');
            material_price.value = data.price;

            if (data.price == undefined) {
            material_price.value = 0
            }
            amount_sum();

        }
    });
});


$(document).on("change", "select#mcolor_store_id", function(e){
    $.ajax({
        url: "/mcolors/"+$(this).val() ,
        dataType: "json",
        data: { id: $(this).val() },
        success: function(data){
            console.log(data.price);
            var mcolor_price = document.getElementById('price_mcolor');
            mcolor_price.value = data.price;

            if (data.price == undefined) {
            mcolor_price.value = 0
            }
            amount_sum();

        }
    });
});


$(document).on("change", "select#gcolor_store_id", function(e){
    $.ajax({
        url: "/gcolors/"+$(this).val() ,
        dataType: "json",
        data: { id: $(this).val() },
        success: function(data){
            console.log(data.price);
            var gcolor_price = document.getElementById('price_gcolor');
            gcolor_price.value = data.price;

            if (data.price == undefined) {
            gcolor_price.value = 0
            }
            amount_sum();

        }
    });
});

$(document).on("change", "select#procedure_store_id", function(e){
    $.ajax({
        url: "/procedures/"+$(this).val() ,
        dataType: "json",
        data: { id: $(this).val() },
        success: function(data){
            console.log(data.price);
            var procedure_price = document.getElementById('price_procedure');
            procedure_price.value = data.price;

            if (data.price == undefined) {
            procedure_price.value = 0
            }
            amount_sum();

        }
    });
});



/*JS pending refactoring*/
//
// (function() {
//     // $.mask.definitions['~']='[+-]';
//     //$(".money-mask").mask("9? 99? 9999",{placeholder:" "});
//     $(".phone-mask").mask("(999) 999-9999");
//     $("#e1").select2();
//     $('#e1').select2({
//         language: {
//             noResults: function() {
//                 return "Cliente no encontrado.  <a href='/clients/new'>Desea crearlo?</a>";
//             }
//         },
//         escapeMarkup: function(markup) {
//             return markup;
//         }
//     });
// })();
//
// (function() {
//   $('.datepicker').pickadate({
//         format: 'yyyy-mm-dd',
//         //set today the min date
//         min: true,
//         // Strings and translations
//         selectMonths: true, // Creates a dropdown to control month
//         selectYears: 15, // Creates a dropdown of 15 years to control year
//         monthsShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
//         monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
//         weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
//         weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
//
//         // Buttons
//         today: 'Hoy',
//         clear: 'Borrar',
//         close: 'X',
//
//         // Accessibility labels
//         labelMonthNext: 'Siguiente Mes',
//         labelMonthPrev: 'Mes Anterior',
//         labelMonthSelect: 'Seleccionar Mes',
//         labelYearSelect: 'Seleccionar Año'
//
//
//
//       });
// })();
//
//
// function printpage(){
//      window.print()
//   }
//
//   $(document).ready(function() {
//     // Materialize.updateTextFields();
//     $('.modal-trigger').leanModal();
//     //$('.modal').modal();
//     // $('.modal-trigger').leanmodal();
//   });
//
//
//   $(document).ready(function(){
//
//       $('.collapsible').collapsible({
//       accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
//           });
//   });
//
//
//
//   $( document ).ready(function(){
//   //
//   $(function() {
//       Materialize.updateTextFields();
//   });
//
//   //$('.modal-trigger').leanModal();
//
//   // $(function() {
//   //
//   // });
//   $(".button-collapse").sideNav();
//   $('select').material_select();
//   $('.tooltipped').tooltip({delay: 25});
//   $('ul.tabs').tabs();
//   $('input#input_text, textarea#textarea1').characterCounter();
//
//
//   //Datepicker withou date restriction
//   $('.datepicker_all').pickadate({
//     format: 'yyyy-mm-dd',
//     // Strings and translations
//     selectMonths: true, // Creates a dropdown to control month
//     selectYears: 15, // Creates a dropdown of 15 years to control year
//     monthsShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
//     monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
//     weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
//     weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
//
//     // Buttons
//     today: 'Hoy',
//     clear: 'Borrar',
//     close: 'Cerrar',
//
//     // Accessibility labels
//     labelMonthNext: 'Siguiente Mes',
//     labelMonthPrev: 'Mes Anterior',
//     labelMonthSelect: 'Seleccionar Mes',
//     labelYearSelect: 'Seleccionar Año'
//
//
//
//   });
//   $(".tabfactura").click(function() {
//     document.getElementById("invoice_tab").className = document.getElementById("invoice_tab").className.replace(/\bdisabled\b/,'');
//     $('ul.tabs').tabs('select_tab', 'test2');
//
//   });
//   $(".tabfactura_back").click(function() {
//     $('ul.tabs').tabs('select_tab', 'test1');
//
//   });
//
//
//
//   /*Changes Order Date to disabled and clear date if exist*/
//   $("#sale_coti").click(function() {
//             if (this.checked == true) {
//               document.getElementById("sale_order_date").disabled = "disabled";
//               document.getElementById("sale_order_date").value = "";
//             }
//             else{
//               document.getElementById("sale_order_date").disabled = "";
//              }
//       });
//
//     $(function(){
//         $('a[data-reload="true"]').on('click', function(e) {
//
//             var delay=1000;
//             setTimeout(function() {
//                 window.location = $(e.target).attr('href');
//                 window.location.reload(true);
//             }, delay);
//
//         });
//     });
// });
