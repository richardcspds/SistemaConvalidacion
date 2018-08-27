# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $('#convalidacion_universidad_home_id').prop("selectedIndex", -1)
  $('#convalidacion_carrera_home_id').parent().hide()
  carreras = $('#convalidacion_carrera_home_id').html()
  $('#convalidacion_universidad_home_id').change ->
    universidad = $('#convalidacion_universidad_home_id :selected').text()
    options = $(carreras).filter("optgroup[label='#{universidad}']").html()
    if options
      $('#convalidacion_carrera_home_id').html(options)
      $('#convalidacion_carrera_home_id').prop("selectedIndex", -1)
      $('#convalidacion_carrera_home_id').parent().show()
    else
      $('#convalidacion_carrera_home_id').empty()

  $('#convalidacion_pensum_home_id').parent().hide()
  $('#convalidacion_carrera_home_id').change ->
    pensums = $('#convalidacion_pensum_home_id').html()
    carrera = $('#convalidacion_carrera_home_id :selected').text()
    options = $(pensums).filter("optgroup[label='#{carrera}']").html()
    if options
      $('#convalidacion_pensum_home_id').html(options)
      $('#convalidacion_pensum_home_id').prop("selectedIndex", -1)
      $('#convalidacion_pensum_home_id').parent().show()
    else
      $('#convalidacion_pensum_home_id').empty()

  # $('#convalidacion_pensum_home_id').change ->
  #   asignaturas = $('#convalidacion_asignaturas_home_id').html()
  #   pensum = $('#convalidacion_pensum_home_id :selected').text()
  #   options = $(asignaturas).filter("optgroup[label='#{pensum}']").html()
  #   if options
  #     $('#convalidacion_asignaturas_home_id').html(options)

  $('#convalidacion_universidad_procedencia_id').prop("selectedIndex", -1)
  $('#convalidacion_carrera_procedencia_id').parent().hide()
  carreras = $('#convalidacion_carrera_procedencia_id').html()
  $('#convalidacion_universidad_procedencia_id').change ->
    universidad = $('#convalidacion_universidad_procedencia_id :selected').text()
    options = $(carreras).filter("optgroup[label='#{universidad}']").html()
    if options
      $('#convalidacion_carrera_procedencia_id').html(options)
      $('#convalidacion_carrera_procedencia_id').prop("selectedIndex", -1)
      $('#convalidacion_carrera_procedencia_id').parent().show()
    else
      $('#convalidacion_carrera_procedencia_id').empty()

  $('#convalidacion_pensum_procedencia_id').parent().hide()
  $('#convalidacion_carrera_procedencia_id').change ->
    pensums = $('#convalidacion_pensum_procedencia_id').html()
    carrera = $('#convalidacion_carrera_procedencia_id :selected').text()
    options = $(pensums).filter("optgroup[label='#{carrera}']").html()
    if options
      $('#convalidacion_pensum_procedencia_id').html(options)
      $('#convalidacion_pensum_procedencia_id').prop("selectedIndex", -1)
      $('#convalidacion_pensum_procedencia_id').parent().show()
    else
      $('#convalidacion_pensum_procedencia_id').empty()
