$ ->
  $('.delete-product').click ->
    current_product = $(this).parents('tr')[0]
    if confirm 'Delete this car?'
      $(current_product).fadeOut(200)