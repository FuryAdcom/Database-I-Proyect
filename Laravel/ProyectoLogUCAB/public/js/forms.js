$("#inputClasificacion").on('change', function() {
    if ($("#inputClasificacion").val() === "a"){
          $("#vehAereo").show();
          $("#vehMar").hide();
          $("#vehTer").hide();
  }else if($("#inputClasificacion").val() === "m"){
        $("#vehMar").show();
        $("#vehAereo").hide();
        $("#vehTer").hide();
  }else if($("#inputClasificacion").val() === "t"){
        $("#vehTer").show();
        $("#vehAereo").hide();
        $("#vehMar").hide();
  }
     else{
          $("#vehAereo").hide();
          $("#vehMar").hide();
          $("#vehTer").hide();
        }
})

$("#inputCharge").change(function() {
      $('#inputEncargado').toggle();
      $('#inputEncargado2').toggle();
})

