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

  //~~~~~~~~~~~~~
  //start of tglr
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
  //end of tglr
  //~~~~~~~~~~~~~
  //~~~~~~~~~~~~~
  //user info container animations
  $("#expand_container").click(function(){
    $('#login_info_container').css(
      'display', 'block'
    )
    $('#login_info_container').animate({
      width: "100%",
      opacity: '1'
    },1000, function(){
      $('#login_info').animate({
        opacity: '1'
      }, 500, function(){
        $('#close_container').animate({
          opacity: '1'
        }, 500)
      })
    });
  });

  //close_container
  $('#close_container').click(function(){
    $('#close_container').animate({
      opacity: '0'
    }, 500, function(){
      $('#login_info').animate({
        opacity: '0'
      }, 500, function(){
      $('#login_info_container').animate({
        opacity: '0',
        width: "0"
      },1000, function(){
        $('#login_info_container').css(
          'display', 'none'
        );
      });
    });
  });
  });
  //end of animations
  //~~~~~~~~~~~~~
});
