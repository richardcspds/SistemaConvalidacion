# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  
  # identify elements
  universidad_home_selector = $('#convalidacion_universidad_home_id')
  carreras_home_selector = $('#convalidacion_carrera_home_id')
  pensum_home_selector = $('#convalidacion_pensum_home_id')
  universidad_procedencia_selector = $('#convalidacion_universidad_procedencia_id')
  carreras_procedencia_selector = $('#convalidacion_carrera_procedencia_id')
  pensum_procedencia_selector = $('#convalidacion_pensum_procedencia_id')
 
  # default blank university
  universidad_home_selector.prop("selectedIndex", -1)
  universidad_procedencia_selector.prop("selectedIndex", -1)
  # when universidad selection changes
  universidad_home_selector.change ->

    #reset carreras and pensum selector and determine universidad id selected
    carreras_home_selector.empty()
    pensum_home_selector.empty()
    universidad_id = universidad_home_selector.val()   

    # get the carreras options for the selector according to the selected universidad through Json
    $.ajax({
      dataType: "json",
      url: '/carreras',
      type: 'GET'
      success: (data) ->
        $.each(data, (i, nombre) ->    
          if (this.universidad_id.toString() == universidad_id)         
            carreras_home_selector.append('<option value="' + this.universidad_id + '">' + this.nombre + '<option>')
            console.log('added option ' + this.nombre + ' to selector with id ' + this.universidad_id)        
        )
        #set the carreras selector to blank
        carreras_home_selector.prop("selectedIndex", -1)   
      });

  #same procedure but this time to fill the pensum selector
  carreras_home_selector.change ->

    pensum_home_selector.empty()
    carrera_id = carreras_home_selector.val()

    $.ajax({
      dataType: "json",
      url: '/pensums',
      type: 'GET'
      success: (data) ->
        $.each(data, (i, nombre) ->  
          if (this.carrera_id.toString() == carrera_id)          
            pensum_home_selector.append('<option value="' + this.carrera_id + '">' + this.nombre + '<option>')
            console.log('added option ' + this.nombre + ' to selector with id ' + this.carrera_id)        
        )
        #set the pensum selector to blank
        pensum_home_selector.prop("selectedIndex", -1)   
      });

  universidad_procedencia_selector.change ->

    #reset carreras and pensum selector and determine universidad id selected
    carreras_procedencia_selector.empty()
    carreras_procedencia_selector.empty()
    universidad_id = universidad_procedencia_selector.val()   

    # get the carreras options for the selector according to the selected universidad through Json
    $.ajax({
      dataType: "json",
      url: '/carreras',
      type: 'GET'
      success: (data) ->
        $.each(data, (i, nombre) ->    
          if (this.universidad_id.toString() == universidad_id)                       
            carreras_procedencia_selector.append('<option value="' + this.universidad_id + '">' + this.nombre + '<option>')
            console.log('added option ' + this.nombre + ' to selector with id ' + this.universidad_id)        
        )
        #set the carreras selector to blank
        carreras_procedencia_selector.prop("selectedIndex", -1)   
      });

  carreras_procedencia_selector.change ->

    pensum_procedencia_selector.empty()
    carrera_id = carreras_procedencia_selector.val()

    $.ajax({
      dataType: "json",
      url: '/pensums',
      type: 'GET'
      success: (data) ->
        $.each(data, (i, nombre) ->  
          if (this.carrera_id.toString() == carrera_id)          
            pensum_procedencia_selector.append('<option value="' + this.carrera_id + '">' + this.nombre + '<option>')
            console.log('added option ' + this.nombre + ' to selector with id ' + this.carrera_id)        
        )
        #set the pensum selector to blank
        pensum_procedencia_selector.prop("selectedIndex", -1)   
      });    