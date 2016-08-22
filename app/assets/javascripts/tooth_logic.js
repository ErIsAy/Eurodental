function reply_click(toothid)
  {
//  var x = event.srcElement.id;
  var x = toothid;
  // console.log(x);
  var y = String(x).replace(/\D/g, '');
  var ToothColor = $("#"+String(x)).attr("style");

  if (String(ToothColor) != 'fill: lightskyblue;'){
    $("#"+String(x)).css({ fill: "lightskyblue" });
    //console.log("#t"+y);
    document.getElementById("t"+y).value = 1;
    }
  else {
    $("#"+String(x)).css({ fill: "white" });
    //console.log("#t"+y);
    document.getElementById("t"+y).value = 0;
    }
  };
//$("#Tooth10").css({ fill: "lightskyblue" });
