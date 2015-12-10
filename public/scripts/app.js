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
  //end infex login btns
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
