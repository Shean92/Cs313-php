$(document).ready(function(){
  $("#register").click(function(){
    var isValid = validateRegistration();
    console.log(isValid);
    if(isValid){
      var registration = {
        performance: $("#performance").data("value"),
        first_name: $("#first_name").val(),
        last_name: $("#last_name").val(),
        student_id: $("#student_id").val(),
        skill: $("#skill").data("value"),
        instrument: $("#instrument").data("value"),
        location: $('input[name=location]:checked').val(),
        room: $('input[name=classRoom]:checked').val(),
        time_slot: $('input[name=time]:checked').val(),
      }

      if(registration.performance === "Duet"){
        registration.first_name_2 = $("#first_name_2").val();
        registration.last_name_2 = $("#last_name_2").val();
        registration.student_id_2 = $("#student_id_2").val();
      }
      //register student: write info to disk in data
      $.post("./assign12.php", {data: registration, method: "register"}, function(response, error){
        console.log(response, error);
      }, "json")
       var html = "<li>" + JSON.stringify(registration) + "</li>";
        $("#end").append(html);
      //include them in our list
      //display list
    }
  });

  $("#clear").click(function(){

  })

  function validateRegistration(){
    var isValid = true;
    $(".error_text").hide();
    $('.reqField').each(function(){
      console.log($(this).prop("id"), $(this).css('display'))
      if($(this).is("button") && $(this).data("value") === ""){console.log("hello!!!!!!!!!!!!")
        $("#" + $(this).prop("id") + "_error").show();
        isValid = false;
      }
      else if(!$(this).is("button") && $(this).val() === ""){
        $("#" + $(this).prop("id") + "_error").show();
        isValid = false;
      }
    });
    return isValid;
  }

  $(".dropbtn").click(function(){
    $("." + $(this).prop("id") + "List").toggle("show");
  });

  $(".perfType").click(function(){
    var selected = $(this).data("value")
    $("#performance").data("value", selected);
    $("#performance").text(selected);
    if(selected === "Duet")
    {
      $(".duet").show('fast');
      $(".duet input").addClass("reqField");
    }
    else{
      $(".duet").hide('fast');
      $(".duet input").removeClass("reqField");
    }
    $(".performanceList").hide();
  });

  $(".skill").click(function(){
    var selected = $(this).data("value")
    $("#skill").data("value", selected);
    $("#skill").text(selected);
    $(".skillList").hide();
  });

  $(".instrument").click(function(){
    var selected = $(this).data("value")
    $("#instrument").data("value", selected);
    $("#instrument").text(selected);
    $(".instrumentList").hide();
  });

  function populateRegisterStudents(){
    $.post("./assign12.php", function(response){
        console.log(response);
        if(response === null)
          return;
        var html = "";
        for(var i = 0; i < response.length; i++){
          html += "<li>" + JSON.stringify(response[i]) + "</li>";
        }
        $("#end").html(html);
      }, "json")}

    populateRegisterStudents()
})