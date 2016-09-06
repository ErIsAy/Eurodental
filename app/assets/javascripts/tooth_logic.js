
function close_box(b_id){
    var button_id = String(b_id).replace(/\D/g, '');
    var service_box2 = document.getElementsByClassName('box'+button_id)[0];
    service_box2.style.display = "none";
    $("#Tooth"+button_id).css({ fill: "white" });
    document.getElementById("t"+button_id).value = 0;
}

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

    /*show the box*/
    service_box.style.display = "inline";
    tooth_number.value = y;
  }
    else {
    $("#"+String(x)).css({ fill: "white" });
    document.getElementById("t"+y).value = 0;

    /*hide the box*/
    service_box.style.display = "none";

    }
}

