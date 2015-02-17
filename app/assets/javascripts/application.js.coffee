#= require jquery
#= require jquery-ui
#= require jquery.turbolinks
#= require bootstrap-sprockets
#= require jquery_ujs
#= require best_in_place
#= require best_in_place.purr
#= require data-confirm-modal
#= require turbolinks
#= require_tree .

$ ->
  $('.best_in_place').best_in_place()
  $('.alert').fadeOut 3000
  if (window.location.hash == "#sign_in")
    $('#signIn').modal('show')
