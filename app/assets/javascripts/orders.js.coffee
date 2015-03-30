$ ->
  $('#order_start_date').datepicker
    dateFormat: 'D, M d, yy',
    minDate: 0,
    onSelect: (selected) ->
      $('#order_end_date').datepicker 'option','minDate', selected
    beforeShowDay: (date) ->
      booked_dates = $('.orders').text().split(', ')
      current_date = $.datepicker.formatDate('yy-mm-dd', date)
      return [booked_dates.indexOf(current_date) == -1]

  $('#order_end_date').datepicker
    dateFormat: 'D, M d, yy',
    minDate: 0,
    onSelect: (selected) ->
      $('#order_start_date').datepicker 'option','maxDate', selected
    beforeShowDay: (date) ->
      booked_dates = $('.orders').text().split(', ')
      current_date = $.datepicker.formatDate('yy-mm-dd', date)
      return [booked_dates.indexOf(current_date) == -1]
