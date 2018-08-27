# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#pensum_carrera_id').parent().hide()
  carreras = $('#pensum_carrera_id').html()
  $('#pensum_universidad_id').change ->
    universidad = $('#pensum_universidad_id :selected').text()
    options = $(carreras).filter("optgroup[label='#{universidad}']").html()
    if options
      $('#pensum_carrera_id').html(options)
      $('#pensum_carrera_id').parent().show()
    else
      $('#pensum_carrera_id').empty()
      $('#pensum_carrera_id').parent().hide()
