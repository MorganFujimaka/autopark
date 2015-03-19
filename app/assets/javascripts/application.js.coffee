#= require jquery
#= require jquery-ui
#= require jquery.turbolinks
#= require jquery.validate
#= require jquery.validate.additional-methods
#= require bootstrap-sprockets
#= require jquery_ujs
#= require best_in_place
#= require best_in_place.purr
#= require turbolinks
#= require_tree .

$ ->
  $('.best_in_place').best_in_place()
  $('.alert').fadeOut 3000

  $('.title').draggable()

  $('#signup_form').validate
    rules:
      'user[email]': {required: true, email: true},
      'user[password]': {required: true, minlength: 8},
      'user[password_confirmation]': {required: true, minlength: 8, equalTo: '#new_password'}
