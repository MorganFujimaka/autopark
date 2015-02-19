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

  $('#signup_form').validate
    rules:
      'user[password]': { minlength: 8 },
      'user[password_confirmation]': { equalTo: '#user_password' }
