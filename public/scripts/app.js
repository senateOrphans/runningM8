var tracker;

$(document).ready(function(){

  tracker = 0;
  //index login btns
  //~~~~~~~~~~~~~
  $("#register_btn").click(function(){
    $("#index_login_section").hide();
    $("#index_register_section").show();
    console.log('hidden')
  });
  $("#login_btn").click(function(){
    $("#index_register_section").hide();
    $("#index_login_section").show();
    console.log('yay')
  });
  //~~~~~~~~~~~~~
  //end index login btns

  //~~~~~~~~~~~~~
  //password match
  function checkPasswordMatch() {
    console.log('triggered pw match');
    var password = $("#password").val();
    var confirmPassword = $("#password_confirm").val();

    if (password != confirmPassword) {
      $("#pwdMessage").html("Passwords do not match!");
      $("#reg_sbm_btn").css(
        'display', 'none'
      )
    } else {
      $("#pwdMessage").html("Passwords match.");
      $("#reg_sbm_btn").css(
        'display', 'block'
      )
    }
  }
  $("#password_confirm").on('keyup', checkPasswordMatch);
  //end of password match
  //~~~~~~~~~~~~~

  $( ".tglr" ).click(function(e) {
    if( 0 == tracker % 2){
      $( "#header_logo" ).fadeTo("slow", 1);
      $( "#header_title" ).fadeTo("slow", 0);
      // $('header').css(
      //   'padding-left', 0
      // );
      console.log(tracker);
      tracker++;
      console.log(tracker);
    }else if (1 == tracker % 2) {
      $( "#header_logo" ).fadeTo("slow", 0);
      $( "#header_title" ).fadeTo("slow", 1);
      // $('header').css(
      //   'padding-left', 0+'%'
      // );
      console.log(tracker);
      tracker++;
      console.log(tracker);
    }
  });


});
