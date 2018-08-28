# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    
    # Identify elements
    universidad_home_selector = $('#relacion_universidad_local_id')
    carreras_home_selector = $('#relacion_carrera_local_id')
    pensum_home_selector = $('#relacion_pensum_local_id')
    asignatura_home_selector = $('#relacion_asignatura_local_id')
    asignatura_creditos_home_textbox =  $('#asignatura_local_creditos_id')

    universidad_procedencia_selector = $('#relacion_universidad_procedencia_id')
    carreras_procedencia_selector = $('#relacion_carrera_procedencia_id')
    pensum_procedencia_selector = $('#relacion_pensum_procedencia_id')
    asignatura_a_procedencia_selector = $('#relacion_asignatura_a_procedencia_id')
    asignatura_a_creditos_procedencia_textbox =  $('#asignatura_a_procedencia_creditos_id')
    asignatura_b_procedencia_selector = $('#relacion_asignatura_b_procedencia_id')
    asignatura_b_creditos_procedencia_textbox =  $('#asignatura_b_procedencia_creditos_id')

    # when universidad selection changes
    universidad_home_selector.change ->

        #reset carreras and pensum selector and determine universidad id selected
        carreras_home_selector.empty()
        pensum_home_selector.empty()
        asignatura_home_selector.empty()
        asignatura_creditos_home_textbox.val('#')

        universidad_id = universidad_home_selector.val()   

        # get the carreras options for the selector according to the selected universidad through Json
        $.ajax({
        dataType: "json",
        url: '/carreras',
        type: 'GET'
        success: (data) ->            
            $.each(data, (i, nombre) ->
                if (this.universidad_id.toString() == universidad_id)         
                    carreras_home_selector.append('<option value="' + this.id + '">' + this.nombre + '<option>')
                    console.log('added option ' + this.nombre + ' to selector with value ' + this.id)        
                )
            cleanEmptyOptions ->
            #set the carreras selector to blank
            carreras_home_selector.prop("selectedIndex", -1)   
        });

    carreras_home_selector.change ->

        pensum_home_selector.empty()
        asignatura_home_selector.empty()
        asignatura_creditos_home_textbox.val('#')

        carrera_id = carreras_home_selector.val()

        $.ajax({
        dataType: "json",
        url: '/pensums',
        type: 'GET'
        success: (data) ->
            $.each(data, (i, nombre) ->  
                if (this.carrera_id.toString() == carrera_id)          
                    pensum_home_selector.append('<option value="' + this.id + '">' + this.nombre + '<option>')
                    console.log('added option ' + this.nombre + ' to selector with value ' + this.id)        
                )
            cleanEmptyOptions ->
            #set the pensum selector to blank
            pensum_home_selector.prop("selectedIndex", -1)   
        });

    pensum_home_selector.change ->
        asignatura_home_selector.empty()
        asignatura_creditos_home_textbox.val('#')

        pensum_id = pensum_home_selector.val()

        $.ajax({
        dataType: "json",
        url: '/asignaturas',
        type: 'GET'
        success: (data) ->
            $.each(data, (i, nombre) ->  
                if (this.pensum_id.toString() == pensum_id)                          
                    asignatura_home_selector.append('<option value="' + this.id + '">' + this.nombre + '<option>')
                    console.log('added option ' + this.nombre + ' to selector with value ' + this.id)
            )                
            cleanEmptyOptions ->
            #set the pensum selector to blank
            asignatura_home_selector.prop("selectedIndex", -1)   
        });
        
    asignatura_home_selector.change ->
        asignatura_creditos_home_textbox.val('#')
        asignatura_id = asignatura_home_selector.val()
        console.log(asignatura_id + 'asignatura current')

        $.ajax({
        dataType: "json",
        url: '/asignaturas',
        type: 'GET'
        success: (data) ->
            $.each(data, (i, creditos) ->  
                if (this.id.toString() == asignatura_id)
                    asignatura_creditos_home_textbox.val(this.creditos.toString())
                    console.log('this asignatura has ' + this.creditos + ' creditos')
            )
            cleanEmptyOptions ->                  
        });
       
    universidad_procedencia_selector.change ->

        #reset carreras pensum and asignaturas selectors and determine universidad id selected
        carreras_procedencia_selector.empty()
        pensum_procedencia_selector.empty()
        asignatura_a_procedencia_selector.empty()
        asignatura_b_procedencia_selector.empty()
        asignatura_a_creditos_procedencia_textbox.val('#')
        asignatura_b_creditos_procedencia_textbox.val('#')

        universidad_id = universidad_procedencia_selector.val()   
        
        # get the carreras options for the selector according to the selected universidad through Json
        $.ajax({
        dataType: "json",
        url: '/carreras',
        type: 'GET'
        success: (data) ->
            $.each(data, (i, nombre) ->    
                if (this.universidad_id.toString() == universidad_id)                       
                    carreras_procedencia_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
                    console.log('added option ' + @nombre + ' to selector with value ' + @id)        
            )
            cleanEmptyOptions ->
            #set the carreras selector to blank
            carreras_procedencia_selector.prop("selectedIndex", -1)   
        });

    carreras_procedencia_selector.change ->

            pensum_procedencia_selector.empty()
            asignatura_a_procedencia_selector.empty()
            asignatura_b_procedencia_selector.empty()
            asignatura_a_creditos_procedencia_textbox.val('#')
            asignatura_b_creditos_procedencia_textbox.val('#')

            carrera_id = carreras_procedencia_selector.val()

            $.ajax({
            dataType: "json",
            url: '/pensums',
            type: 'GET'
            success: (data) ->
                $.each(data, (i, nombre) ->  
                    if (@carrera_id.toString() == carrera_id)          
                        pensum_procedencia_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
                        console.log('added option ' + @nombre + ' to selector with value ' + @id)        
                    )
                cleanEmptyOptions ->
                #set the pensum selector to blank
                pensum_procedencia_selector.prop("selectedIndex", -1)   
            });

    pensum_procedencia_selector.change ->
            asignatura_a_procedencia_selector.empty()
            asignatura_b_procedencia_selector.empty()
            asignatura_a_creditos_procedencia_textbox.val('#')
            asignatura_b_creditos_procedencia_textbox.val('#')

            pensum_id = pensum_procedencia_selector.val()

            $.ajax({
            dataType: "json",
            url: '/asignaturas',
            type: 'GET'
            success: (data) ->
                $.each(data, (i, nombre) ->  
                    if (@pensum_id.toString() == pensum_id)                          
                        asignatura_a_procedencia_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
                        console.log('added option ' + @nombre + ' to asignatura A with value ' + @id)
                        asignatura_b_procedencia_selector.append('<option value="' + @id + '">' + @nombre + '<option>')
                        console.log('added option ' + @nombre + ' to asignatura B with value ' + @id)
                )                
                cleanEmptyOptions ->
                #set the pensum selector to blank
                asignatura_a_procedencia_selector.prop("selectedIndex", -1)
                asignatura_b_procedencia_selector.prop("selectedIndex", -1)    
            });
            
    asignatura_a_procedencia_selector.change ->
            asignatura_a_creditos_procedencia_textbox.val('#')

            asignatura_id = asignatura_a_procedencia_selector.val()

            $.ajax({
            dataType: "json",
            url: '/asignaturas',
            type: 'GET'
            success: (data) ->
                $.each(data, (i, creditos) ->  
                    if (@id.toString() == asignatura_id)
                        asignatura_a_creditos_procedencia_textbox.val(@creditos.toString())
                        console.log('this asignatura has ' + @creditos + ' creditos')
                )
                cleanEmptyOptions ->                  
            });

    asignatura_b_procedencia_selector.change ->
                asignatura_b_creditos_procedencia_textbox.val('#')

                asignatura_id = asignatura_b_procedencia_selector.val()

                $.ajax({
                dataType: "json",
                url: '/asignaturas',
                type: 'GET'
                success: (data) ->
                    $.each(data, (i, creditos) ->  
                        if (@id.toString() == asignatura_id)
                            asignatura_b_creditos_procedencia_textbox.val(@creditos.toString())
                            console.log('this asignatura has ' + @creditos + ' creditos')
                    )
                    cleanEmptyOptions ->                  
                });
        

# functions

cleanEmptyOptions = ->
    $('select option').filter(->
            !@value or $.trim(@value).length == 0 or $.trim(@text).length == 0
        ).remove()
