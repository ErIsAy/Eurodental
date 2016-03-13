$(document).on("click", "a", function (e) {
e.preventDefault();
newLocation = this.href;
$('html').fadeOut('slow', newpage);
});
function newpage() {
window.location = newLocation;
}

$(document).ready(function(){

/*! Fades in whole page on load */
$('html').css('display', 'none');
$('html').fadeIn('slow');

});
