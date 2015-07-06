var filters = function(){
  if ( $("#filters-form input[type='checkbox']").is(':checked') || $('#price_min').val() || $('#price_max').val() ){
    $('.filters').show();
    $('.caret-wrap').addClass('dropup');
  }; 
  if ( $('.filters').css('display','block')){
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
};
