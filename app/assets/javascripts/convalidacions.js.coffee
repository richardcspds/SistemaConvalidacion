# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready -> 
  jQuery ->
    
    # identify elements
    universidad_home_selector = $('#convalidacion_universidad_home_id')
    carreras_home_selector = $('#convalidacion_carrera_home_id')
    pensum_home_selector = $('#convalidacion_pensum_home_id')
    universidad_procedencia_selector = $('#convalidacion_universidad_procedencia_id')
    carreras_procedencia_selector = $('#convalidacion_carrera_procedencia_id')
    pensum_procedencia_selector = $('#convalidacion_pensum_procedencia_id')

    # Select Lists
    asignaturas_home_list = $('#asignaturas_home_choose')
    asignaturas_procedencia_list = $('#asignaturas_procedencia_choose')

    # Buttons
    convalidar_seleccion_button = $('#convalidar_seleccion_button_id')
  
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
            if (@universidad_id.toString() == universidad_id)         
              carreras_home_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
              console.log('added option ' + @nombre + ' to selector with value' + @id)        
          )
          cleanEmptyOptions ->
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
            if (@carrera_id.toString() == carrera_id)          
              pensum_home_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
              console.log('added option ' + @nombre + ' to selector with id ' + @id)        
          )
          cleanEmptyOptions ->
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
            if (@universidad_id.toString() == universidad_id)                       
              carreras_procedencia_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
              console.log('added option ' + @nombre + ' to selector with id ' + @id)        
          )
          cleanEmptyOptions ->
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
            if (@carrera_id.toString() == carrera_id)          
              pensum_procedencia_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
              console.log('added option ' + @nombre + ' to selector with id ' + @id)        
          )
          cleanEmptyOptions ->
          #set the pensum selector to blank
          pensum_procedencia_selector.prop("selectedIndex", -1)   
        });    

    pensum_home_selector.change ->
        $.ajax({
        dataType: "json",
        url: '/asignaturas',
        type: 'GET'
        success: (data) ->
          $.each(data, (i, nombre) ->  
            if (@pensum_id.toString() == pensum_home_selector.val())    
              markup = '<option class="list-group-item" value="' + @id + '">' + @clave + '  |  ' + @nombre + '  |  CR: ' + @creditos + '<option>'
              console.log(markup)
              asignaturas_home_list.append(markup)
              console.log('added option ' + @nombre + ' to selector with id ' + @id)        
          )
          cleanEmptyOptions ->   
        });

    pensum_procedencia_selector.change ->
      $.ajax({
      dataType: "json",
      url: '/asignaturas',
      type: 'GET'
      success: (data) ->
        $.each(data, (i, nombre) ->  
          if (@pensum_id.toString() == pensum_procedencia_selector.val())    
            markup = '<option class="list-group-item" value="' + @id + '">' + @clave + '  |  ' + @nombre + '  |  CR: ' + @creditos + '<option>'
            console.log(markup)
            asignaturas_procedencia_list.append(markup)
            console.log('added option ' + @nombre + ' to selector with id ' + @id)        
        )
        cleanEmptyOptions ->   
      });

    convalidar_seleccion_button.click ->
      console.log('here')
      selected = asignaturas_procedencia_list.val()
      $.ajax({
      dataType: "json",
      url: '/asignaturas',
      type: 'GET'
      success: (data) ->
        $.each(data, (i, id) ->  
          console.log(@id.toString() in selected)
          if (@id.toString() in selected)              
            markup = '<tr><td><input type="checkbox" id="record'+ @id + '></td><td>' + @clave + '</td><td>' + @nombre + '</td><td>' + @creditos + '</td></tr>'
            console.log(markup)
                 
        )
      });
      


cleanEmptyOptions = ->
    $('select option').filter(->
            !@value or $.trim(@value).length == 0 or $.trim(@text).length == 0
        ).remove()
