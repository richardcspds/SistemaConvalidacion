# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", -> 
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
    
    # tables
    asignaturas_convalidables_table_body = $('#asignaturas_convalidables_table_tbody_id')

    # Hidden
    div_hidden_item_fields = $('#hidden_items_fields_div_id')
  
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
      
      selected = asignaturas_procedencia_list.val()
      convalidables = []
      $('#asignaturas_home_choose option').each ->
        convalidables.push($(this).val())
      console.log(convalidables)
      markup = ''
      hidden = ''
      x = 0

      $.ajax({
      dataType: "json",
      url: '/asignaturas',
      type: 'GET'
      success: (asignaturas) ->
        $.each(asignaturas, (i, asignatura) ->  
          console.log(@id.toString() in selected)

          # identificar las asignaturas seleccionadas
          if (@id.toString() in selected) 
            $.ajax({
            dataType: "json",
            url: '/relacions',
            type: 'GET'
            success: (relacions) ->
              $.each(relacions, (j, relacion) ->                                  
                # validar si relacion es tipo 1-1
                if (@tipo_relacion.toString() == '1')
                  # si existe relacion y agregar convalidacion
                  if((relacion.asignatura_a_procedencia_id.toString() == asignatura.id.toString()) and (relacion.asignatura_home_id.toString() in convalidables))
                    console.log('existe relacion 1-1 ')

                    $.each(asignaturas, (i,asignatura_h) ->
                      if (relacion.asignatura_home_id.toString() == asignatura_h.id.toString())
                        markup = '<tr><td>' + asignatura.clave + '</td><td>' + asignatura.nombre + '</td><td><input type="text_field" class="form-control" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_calificacion]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_calificacion"></td><td>' + asignatura.creditos + \
                                 '</td><td>' + asignatura_h.clave + '</td><td>' + asignatura_h.nombre + '</td><td>' + asignatura_h.creditos + '</td></tr>'
                        hidden = '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_clave]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_clave" value="'+ asignatura.clave + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_nombre]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_nombre" value="'+ asignatura.nombre + '">'+\                                
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_creditos]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_creditos" value="'+ asignatura.creditos + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_local_clave]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_local_clave" value="'+ asignatura_h.clave + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_local_nombre]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_local_nombre" value="'+ asignatura_h.nombre + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_local_creditos]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_local_creditos" value="'+ asignatura_h.creditos + '">'
                        console.log(markup)
                        x = x + 1
                        asignaturas_convalidables_table_body.append(markup)
                        div_hidden_item_fields.append(hidden)                    
                    )
                # validar si relacion es tipo 1-2
                else if (@tipo_relacion.toString() == '2')
                  # si existe relacion y agregar convalidacion
                  if(((relacion.asignatura_a_procedencia_id.toString() == asignatura.id.toString()) and (relacion.asignatura_b_procedencia_id.toString() in selected) and (relacion.asignatura_home_id.toString() in convalidables)) \
                      or ((relacion.asignatura_b_procedencia_id.toString() == asignatura.id.toString()) and (relacion.asignatura_a_procedencia_id.toString() in selected) and (relacion.asignatura_home_id.toString() in convalidables)))
                    console.log('existe relacion 1-2')
                    $.each(asignaturas, (i,asignatura_h) ->
                      if (relacion.asignatura_home_id.toString() == asignatura_h.id.toString())
                        markup = '<tr><td>' + asignatura.clave + '</td><td>' + asignatura.nombre + '</td><td><input type="text_field" class="form-control" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_calificacion]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_calificacion"></td><td>' + asignatura.creditos + \
                                 '</td><td>' + asignatura_h.clave + '</td><td>' + asignatura_h.nombre + '</td><td>' + asignatura_h.creditos + '</td></tr>'
                        hidden = '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_clave]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_clave" value="'+ asignatura.clave + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_nombre]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_nombre" value="'+ asignatura.nombre + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_procedencia_creditos]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_procedencia_creditos" value="'+ asignatura.creditos + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_local_clave]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_local_clave" value="'+ asignatura_h.clave + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_local_nombre]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_local_nombre" value="'+ asignatura_h.nombre + '">'+\
                                 '<input type="hidden" name="convalidacion[convalidacion_items_attributes][' + x.toString() + '][asignatura_local_creditos]" id="convalidacion_convalidacion_items_attributes_' + x.toString() + '_asignatura_local_creditos" value="'+ asignatura_h.creditos + '">'
                        console.log(markup)
                        x = x + 1
                        asignaturas_convalidables_table_body.append(markup)     
                        div_hidden_item_fields.append(hidden)                
                    )                  
              )
            });                             
        )
      });     

      


cleanEmptyOptions = ->
    $('select option').filter(->
            !@value or $.trim(@value).length == 0 or $.trim(@text).length == 0
        ).remove()
