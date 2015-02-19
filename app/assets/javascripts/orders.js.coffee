# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#order_start_date').datepicker
    dateFormat: "D, M d, yy",
    minDate: 0,
    onSelect: (selected) ->
      $("#order_end_date").datepicker "option","minDate", selected


  $('#order_end_date').datepicker
    dateFormat: "D, M d, yy",
    minDate: 0,
    onSelect: (selected) ->
      $("#order_start_date").datepicker "option","maxDate", selected
