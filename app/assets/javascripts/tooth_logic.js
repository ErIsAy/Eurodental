
function close_box(b_id){
    var button_id = String(b_id).replace(/\D/g, '');
    var service_box2 = document.getElementsByClassName('box'+button_id)[0];
    service_box2.style.display = "none";
    $("#Tooth"+button_id).css({ fill: "white" });
    document.getElementById("t"+button_id).value = 0;
   // document.getElementById("service_exist"+b_id).value = false;
}

function reply_click(toothid)
  {

    for(i=1; i<33; i++) {
      $("#Tooth"+String(i)).css({ fill: "white" });
    }
      var x = toothid;
      var y = String(x).replace(/\D/g, '');
      var ToothColor = $("#"+String(x)).attr("style");
      var service_box = document.getElementsByClassName("box"+y)[0];
      var tooth_number = document.getElementById('tooth_number'); //tooth selection
      var tooth_text = document.getElementById('txtTooth'+y);
      var tooth_inner = document.getElementById('tooth_inner');

      if (String(ToothColor) != 'fill: lightskyblue;'){
        $("#"+String(x)).css({ fill: "lightskyblue" });
        tooth_number.value = y;
        tooth_inner.value = Number(tooth_text.innerHTML);
      }
      else {
      $("#"+String(x)).css({ fill: "white" });
      }
}


/*
function reply_click(toothid)
  {
//  var x = event.srcElement.id;
  var x = toothid;
  var y = String(x).replace(/\D/g, '');
  var ToothColor = $("#"+String(x)).attr("style");
  var service_box = document.getElementsByClassName("box"+y)[0];
  var tooth_number = document.getElementById('tooth_number'+y); //tooth selection


  if (String(ToothColor) != 'fill: lightskyblue;'){
    $("#"+String(x)).css({ fill: "lightskyblue" });
    document.getElementById("t"+y).value = 1;


    service_box.style.display = "inline";
    tooth_number.value = y;
  }
    else {
    $("#"+String(x)).css({ fill: "white" });
    document.getElementById("t"+y).value = 0;


    service_box.style.display = "none";

    }
}*/


/*Add or Remove price for each box*/
function service_add(service, s_price)
{   console.log(service);
    var service_obj = document.getElementById(service);
    var service_id = String(service).replace(/\D/g, '');
    var s_id = parseInt(service_id) + 1;
    var price_sum = Number(document.getElementById("service_total_f"+s_id).value);


    /*get all the actual price values*/
    // var perno_price = parseInt(document.getElementById('perno_price').innerHTML);
    // var soldadura_price = parseInt(document.getElementById('soldadura_price').innerHTML);
    // var zirconio_price = parseInt(document.getElementById('zirconio_price').innerHTML);
    // var disilicato_price = parseInt(document.getElementById('disilicato_price').innerHTML);
    // var fedespatica_price = parseInt(document.getElementById('fedespatica_price').innerHTML);
    // var porcelana_price = parseInt(document.getElementById('porcelana_price').innerHTML);
    // var pmma_price = parseInt(document.getElementById('pmma_price').innerHTML);
    // var polimero_price = parseInt(document.getElementById('polimero_price').innerHTML);
    // var composite_price = parseInt(document.getElementById('composite_price').innerHTML);
    // var metal_porcelana_price = parseInt(document.getElementById('metal_porcelana_price').innerHTML);
    // var zirconio_porcelana_price = parseInt(document.getElementById('zirconio_porcelana_price').innerHTML);
    // var peek_price = parseInt(document.getElementById('peek_price').innerHTML);
    // var vita_classic_price = parseInt(document.getElementById('vita_classic_price').innerHTML);
    // var vita_3d_price = parseInt(document.getElementById('vita_3d_price').innerHTML);
    // var bioform_price = parseInt(document.getElementById('bioform_price').innerHTML);
    // var chromarcop_price = parseInt(document.getElementById('chromarcop_price').innerHTML);
    // var otras_price = parseInt(document.getElementById('otras_price').innerHTML);



    if (service_obj.checked){
        price_sum += s_price;
    }
    else {
        price_sum -= s_price;
    }

    document.getElementById("service_total_f"+s_id).value = price_sum;
    //document.getElementById("service_exist"+s_id).value = true;


    order_total();
}

/*Sum all the boxes price*/
function order_total(){
    var sum = 0;
    document.getElementById("total_price_f").value = '';
    for (var sub_total = 1; sub_total <= 32 ;sub_total++){
        sum += Number(document.getElementById("service_total_f"+sub_total).value);
     }
    document.getElementById("total_price_f").value = sum;
}





/*
 * Assign price values to Totals
 *
 */
// $( document ).ready(function(){
//     $("#order_services_attributes_10_zirconio").click(function() {
//         if (this.checked == true) {
//           //  document.getElementById("total_price_f").innerHTML = "15";
//             document.getElementById("total_price_f").value = 15;
//
//         }
//     });
// });
