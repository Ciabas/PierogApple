// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sass
//= require_tree .

$(document).ready(function(){
  if ( $("#filters-form input[type='checkbox']").is(':checked') || $('#price_min').val() || $('#price_max').val() ){
    $('.filters').show();
    $('.caret-wrap').addClass('dropup');
  }; 
  $('.filters-header').click(function(){
    $('.filters').slideToggle(500,function(){
      $('.caret-wrap').toggleClass('dropup');
    });
  });
  $('#filters-form').submit(function(event){
    var form_ok = true;
    if ( $('#price_min').val() ){
      if ( !$.isNumeric( $('#price_min').val() ) ){
        form_ok = false;
        $('#price_min').addClass('invalid');
      };
    } else {
      $('#price_min').attr('name', '');
    };
    if ( $('#price_max').val() ){
      if ( !$.isNumeric( $('#price_max').val() ) ){
        form_ok = false;
        $('#price_max').addClass('invalid');        
      };
    } else {
      $('#price_max').attr('name', '');
    };
    if ( !$("#filters-form input[type='checkbox']").is(':checked') && ( !$('#price_min').val() ) && ( !$('#price_max').val() ) ) {
      form_ok = false;
    };
    if (!form_ok){
      event.preventDefault();
    };
  });
});