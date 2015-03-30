$ ->
  @booked_dates = $('.orders').text().split('|')
  @current_date = (date) ->
    $.datepicker.formatDate('D, M d, yy', date)

  $('#order_start_date').datepicker
    dateFormat: 'D, M d, yy',
    minDate: 0,
    onSelect: (selected) ->
      $('#order_end_date').datepicker 'option','minDate', selected
    beforeShowDay: (date) ->
      return [booked_dates.indexOf(current_date(date)) == -1]

  $('#order_end_date').datepicker
    dateFormat: 'D, M d, yy',
    minDate: 0,
    onSelect: (selected) ->
      $('#order_start_date').datepicker 'option','maxDate', selected
    beforeShowDay: (date) ->
      return [booked_dates.indexOf(current_date(date)) == -1]

  $('#new_order').submit ->
    date_intersection = undefined

    $.each booked_dates, (index, date) ->
      already_booked_date = new Date(date)
      start_date = new Date($('#order_start_date').val())
      end_date = new Date($('#order_end_date').val())

      if start_date < already_booked_date < end_date
        date_intersection = true
        return

    if date_intersection
      if $('.flash_messages > div').length == 0
        $('.flash_messages').append("<div class='alert alert-warning'>Your order contains disabled dates</div>")
        $('.flash_messages').fadeOut 7000, 'easeInExpo', ->
          $(this).empty().show()
        return false
      else
        return false

    if $('#order_start_date').val() == '' || $('#order_end_date').val() == ''
      if $('.flash_messages > div').length == 0
        $('.flash_messages').append("<div class='alert alert-warning'>Please select Start and End Dates</div>")
        $('.flash_messages').fadeOut 7000, 'easeInExpo', ->
          $(this).empty().show()
        return false
      else
        return false
