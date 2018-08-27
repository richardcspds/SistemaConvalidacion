# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

fieldsControl = ->
  $('#asignatura_universidad_id').prop("selectedIndex", -1)
  $('#asignatura_carrera_id').parent().hide()
  $('#asignatura_pensum_id').parent().hide()

  carreras = $('#asignatura_carrera_id').html()

  $('#asignatura_universidad_id').change ->
    universidad = $('#asignatura_universidad_id :selected').text()
    options = $(carreras).filter("optgroup[label='#{universidad}']").html()

    if options      
      $('#asignatura_carrera_id').empty()     
      $('#asignatura_carrera_id').html(options)
      $('#asignatura_carrera_id').prop("selectedIndex", -1)
      $('#asignatura_carrera_id').parent().show()
    else
      $('#asignatura_carrera_id').empty()
        
  $('#asignatura_carrera_id').change ->
    pensums = $('#asignatura_pensum_id').html()
    carrera = $('#asignatura_carrera_id :selected').text()
    options = $(pensums).filter("optgroup[label='#{carrera}']").html()
    
    if options
      $('#asignatura_pensum_id').empty()
      $('#asignatura_pensum_id').html(options)
      $('#asignatura_pensum_id').prop("selectedIndex", -1)
      $('#asignatura_pensum_id').parent().show()
    else
      $('#asignatura_pensum_id').empty()

 

jQuery ->
  $(document).ready(fieldsControl())
     
    
  