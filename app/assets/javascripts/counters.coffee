# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  console.log("howdy")
  $('.test_div').html("<p>#{$('#date_year').val()}</p>")
  $('#date_year').change ->
    get_table()

get_table = () -> 
  console.log("get table is working")
  $('.test_div').html("<p>#{$('#date_year').val()}</p>")
  $.ajax({
    url: '/ajax',
    type: "POST",
    data: {year:"#{$('#date_year').val()}"},
    success: render_table
  })

render_table = (data) ->
  $('.test_div').append(data)