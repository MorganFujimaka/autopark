$ ->
  $('#delete_product').dialog
    buttons:
      "Confirm": ->
        $(this).dialog('close')
        $.ajax(
          url: '/products/' + $('#delete_product').data('current_product').attr('product_id'),
          type: 'POST',
          data: _method: 'DELETE',
          ).done (data) ->
            $('#delete_product').data('current_product').fadeOut(200)
            $('.flash_messages').append("<div class='alert alert-success'>" + data.notice + "</div>")
            $('.flash_messages').fadeOut 3000
          .fail (data) ->
            $('.flash_messages').append("<div class='alert alert-warning'>" + $.parseJSON(data.responseText).alert + "</div>")
            $('.flash_messages').fadeOut 3000
      "Cancel": ->
        $(this).dialog('close')
    autoOpen: false,
    resizable: false,
    draggable: false,
    width: 300,
    height: 200,
    modal: true

  $('.delete-product').click ->
    current_product = $(this).closest('tr')
    $('#delete_product').data('current_product', $(current_product))
    
    $('#delete_product').dialog('open')

  $('#tabs').tabs()
  $('.details').accordion
    icons:
      header: 'ui-icon-circle-plus',
      activeHeader: 'ui-icon-circle-minus'
    active: false,
    collapsible: true

  $('#tabs').tabs()
