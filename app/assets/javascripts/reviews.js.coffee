# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.delete_review', ->
    current_review = $(this).parents('tr')[0]
    $.ajax
      url: $(current_review).attr('data-product-id') + '/reviews/' + $(current_review).attr('data-review-id'),
      type: 'POST',
      data: _method: 'DELETE',
      success: ->
        $(current_review).fadeOut(200)

  $('form .new-review').submit ->
    message = $(this).serialize()
    $.ajax
      url: $(this).attr('action'),
      type: 'POST',
      data: message,
      success: ->
