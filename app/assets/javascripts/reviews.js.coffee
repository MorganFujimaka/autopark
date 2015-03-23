$ ->
  $(document).on 'click', '.delete_review', ->
    current_review = $(this).parents('tr')[0]
    $.ajax(
      url: $(current_review).attr('data-product-id') + '/reviews/' + $(current_review).attr('data-review-id'),
      type: 'POST',
      data: _method: 'DELETE',
      ).done ->
        $(current_review).fadeOut(200)
        if $('#feedbacks tbody').children(':visible').length == 1
          noReviews = ->
            $('#feedback').append("<p class='no-review'>There are no reviews yet</p>")
          setTimeout noReviews, 201

  $('form .new-review').submit ->
    message = $(this).serialize()
    $.ajax
      url: $(this).attr('action'),
      type: 'POST',
      data: message,
      success: ->
