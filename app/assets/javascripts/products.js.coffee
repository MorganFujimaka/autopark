jQuery ($) ->
  $("#delete-product").click ->
    current_product_tr = $(this).parents('tr')[0]
    if confirm "Delete product?"
      $.ajax
        url: '/products/' + $(current_product_tr).attr('product_id'),
        type: 'POST',
        data: {_method: 'DELETE'},
        success: $(current_product_tr).fadeOut(200)