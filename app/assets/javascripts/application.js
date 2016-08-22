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



/* Sidenav initializer*/
// $( document ).ready(function(){
//   $(".button-collapse").sideNav();
// })
//
//
// $(document).ready(function() {
// 	$('select').material_select();
// });

// $(document).ready(function(){
//   $('.tooltipped').tooltip({delay: 25});
// });



$(document).ready(function(){

$('.collapsible').collapsible({
accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
});
});
