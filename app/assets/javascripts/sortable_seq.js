var sortable_seq = function(){
    $('#sortable').sortable({
      change: function(){
        $('#save_products_seq').removeClass('btn-success').removeClass('btn-warning').addClass('btn-primary').html( "Zapisz" );
      }
    });
  $('#save_products_seq').click(function(){
    var products_ids = []
    $('#sortable .ui-sortable-handle').each(function(){
      products_ids.push( $(this).attr("data-id") );
    });
    $.ajax( URLS.products_seq_update, { 
      method: "PATCH", 
      data: { ids: products_ids },
      dataType: "json",
      beforeSend: function(){
        $('#ajax-loader').show();
      },
      complete: function(){
        $('#ajax-loader').hide();
      },
      error: function(){
        $('#save_products_seq').removeClass('btn-primary').addClass('btn-warning').html( "<span class='glyphicon glyphicon-remove'></span> Błąd, nie zapisano." );
      },
      success: function(){
        $('#save_products_seq').removeClass('btn-primary').addClass('btn-success').html( "<span class='glyphicon glyphicon-ok'></span> Zapisano pomyślnie!" );
      }
   });
  });
};
