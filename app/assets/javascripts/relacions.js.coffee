# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
    jQuery ->
        
        # Identify elements
        universidad_home_selector = $('#relacion_universidad_local_id')
        carreras_home_selector = $('#relacion_carrera_local_id')
        pensum_home_selector = $('#relacion_pensum_local_id')
        asignatura_home_selector = $('#relacion_asignatura_home_id')
        asignatura_creditos_home_textbox =  $('#asignatura_home_creditos_id')

        universidad_procedencia_selector = $('#relacion_universidad_procedencia_id')
        carreras_procedencia_selector = $('#relacion_carrera_procedencia_id')
        pensum_procedencia_selector = $('#relacion_pensum_procedencia_id')
        asignatura_a_procedencia_selector = $('#relacion_asignatura_a_procedencia_id')
        asignatura_a_creditos_procedencia_textbox =  $('#asignatura_a_procedencia_creditos_id')
        asignatura_b_procedencia_selector = $('#relacion_asignatura_b_procedencia_id')
        asignatura_b_creditos_procedencia_textbox =  $('#asignatura_b_procedencia_creditos_id')

        #buttons
        crear_relacion_button = $('#crear_relacion_button_id')

        # when universidad selection changes
        universidad_home_selector.change ->

            #reset carreras and pensum selector and determine universidad id selected
            carreras_home_selector.empty()
            pensum_home_selector.empty()
            asignatura_home_selector.empty()
            asignatura_creditos_home_textbox.val('')

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
            asignatura_creditos_home_textbox.val('')

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
            asignatura_creditos_home_textbox.val('')

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
            asignatura_creditos_home_textbox.val('')
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
            asignatura_a_creditos_procedencia_textbox.val('')
            asignatura_b_creditos_procedencia_textbox.val('')

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
                asignatura_a_creditos_procedencia_textbox.val('')
                asignatura_b_creditos_procedencia_textbox.val('')

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
                asignatura_a_creditos_procedencia_textbox.val('')
                asignatura_b_creditos_procedencia_textbox.val('')

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
                asignatura_a_creditos_procedencia_textbox.val('')

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
                    asignatura_b_creditos_procedencia_textbox.val('')

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

        crear_relacion_button.click ->
            # tipo_relacion = 
            validateRelacionType asignatura_creditos_home_textbox, asignatura_a_creditos_procedencia_textbox, asignatura_b_creditos_procedencia_textbox
            # processSubmit tipo_relacion, asignatura_home_selector.val(), asignatura_a_procedencia_selector.val(), asignatura_b_procedencia_selector.val()
            

# functions

cleanEmptyOptions = ->
    $('select option').filter(->
            !@value or $.trim(@value).length == 0 or $.trim(@text).length == 0
        ).remove()

validateRelacionType = (creditsH, creditsA, creditsB) ->    

    # 1-1 relation
    if creditsH.val() and creditsA.val() and creditsB.val() == ''
        # verify 1-1 has at least -1 credits from home asignatura
        if creditsA.val() >= creditsH.val() - 1
            # if do return type ============SUBMIT HERE==================
            return '1-1'
        else
            # else notify error
            return 'Creditos no suficientes'        
    # 1-2 relation
    else if creditsH.val() and creditsA.val() and creditsB.val()
        console.log("1-2 relation")
        if Number(creditsA.val()) + Number(creditsB.val()) >= Number(creditsH.val())
            # ===========================SUBMIT HERE========================
            return '1-2'            
        else
            return 'Creditos no suficientes'
    else
        return 'Completar campo de credito requerido'

processSubmit = (type, asignatura_h_id, asignatura_a_id, asignatura_b_id) ->
    jsonRelacion = '{asignatura_home_id: "' + asignatura_h_id + '", asignatura_a_procedencia_id: "' + asignatura_a_id + '", asignatura_b_procedencia_id: "' \
    + asignatura_b_id + '"}'
    jsonRelacion2 = '{asignatura_home_id: "2", asignatura_a_procedencia_id: "5", asignatura_b_procedencia_id: "4"}'
    console.log(JSON.stringify(jsonRelacion))
    console.log(JSON.stringify(jsonRelacion2))

    if type == '1-1' or type == '1-2'
        $.ajax({
            dataType: "json",
            url: '/relacions',
            type: 'POST'
            data: JSON.stringify(jsonRelacion)
            success: () ->
                alert('Relacion creada con exito')
                cleanEmptyOptions ->                  
        });
    else
        alert(type)


# jsonRelacion = '{asignatura_home_id: "' + asignatura_home_selector.val() + '", asignatura_a_procedencia_id: "' + asignatura_a_procedencia_selector.val() + '", asignatura_b_procedencia_id: "'
#         + asignatura_b_procedencia_selector.val() +'"}'