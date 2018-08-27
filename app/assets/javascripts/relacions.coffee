# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
fieldsControlLocal = ->
    universidadLocal = $('#relacion_universidad_local_id')
    carrerasLocal = $('#relacion_carrera_local_id')
    pensumsLocal = $('#relacion_pensum_local_id')
    asignaturasLocal = $('#relacion_asignatura_local_id')
    asignaturaLocalCreditos =  $('#relacion_asignatura_local_creditos_id')
    dataAsignaturas = $('#relacion_asignaturas_details_id :data_asignaturas_creditos')

    universidadLocal.prop("selectedIndex", -1) 

    universidadLocal.change ->
        universidadLocalSelected = $('#relacion_universidad_local_id :selected').text()
        optionsCarreras = $(carrerasLocal.html()).filter("optgroup[label='#{universidadLocalSelected}']").html()

        if optionsCarreras      
            carrerasLocal.empty()     
            carrerasLocal.html(optionsCarreras)
            carrerasLocal.prop("selectedIndex", -1)
        else
            carrerasLocal.empty()
        
    carrerasLocal.change ->
        
        carreraLocalSelected = $('#relacion_carrera_local_id :selected').text()
        optionsPensums = $(pensumsLocal.html()).filter("optgroup[label='#{carreraLocalSelected}']").html()
    
        if optionsPensums
            pensumsLocal.empty()
            pensumsLocal.html(optionsPensums)
            pensumsLocal.prop("selectedIndex", -1)
        else
            pensumsLocal.empty()
    
    pensumsLocal.change ->
        
        pensumLocalSelected = $('#relacion_pensum_local_id :selected').text()
        optionsAsignaturas = $(asignaturasLocal.html()).filter("optgroup[label='#{pensumLocalSelected}']").html()

        if optionsAsignaturas
            asignaturasLocal.empty()
            asignaturasLocal.html(optionsAsignaturas)
            asignaturasLocal.prop("selectedIndex", -1)
        else
            asignaturasLocal.empty()

    asignaturasLocal.change ->

        asignaturaLocalSelected = $('#relacion_asignatura_local_id :selected').text()
        creditosAsignatura = $(this).data(asignaturaLocalSelected.creditos)
        

       


 
fieldsControlProcedencia = ->
    universidadProcedencia = $('#relacion_universidad_procedencia_id')
    carrerasProcedencia = $('#relacion_carrera_procedencia_id')
    pensumsProcedencia = $('#relacion_pensum_procedencia_id')
    asignaturasAProcedencia = $('#relacion_asignatura_a_procedencia_id')
    asignaturasBProcedencia = $('#relacion_asignatura_b_procedencia_id')
    asignaturaAProcedenciaCreditos =  $('#relacion_asignatura_a_procedencia_creditos_id')
    asignaturaBProcedenciaCreditos =  $('#relacion_asignatura_b_procedencia_creditos_id')
    dataAsignaturas = $('#relacion_asignaturas_details_id :data_asignaturas_creditos')

    universidadProcedencia.prop("selectedIndex", -1) 

    universidadProcedencia.change ->
        universidadProcedenciaSelected = $('#relacion_universidad_procedencia_id :selected').text()
        optionsCarreras = $(carrerasProcedencia.html()).filter("optgroup[label='#{universidadProcedenciaSelected}']").html()

        if optionsCarreras      
            carrerasProcedencia.empty()     
            carrerasProcedencia.html(optionsCarreras)
            carrerasProcedencia.prop("selectedIndex", -1)
        else
            carrerasProcedencia.empty()
        
    carrerasProcedencia.change ->
        
        carreraProcedenciaSelected = $('#relacion_carrera_procedencia_id :selected').text()
        optionsPensums = $(pensumsProcedencia.html()).filter("optgroup[label='#{carreraProcedenciaSelected}']").html()
    
        if optionsPensums
            pensumsProcedencia.empty()
            pensumsProcedencia.html(optionsPensums)
            pensumsProcedencia.prop("selectedIndex", -1)
        else
            pensumsProcedencia.empty()
    
    pensumsProcedencia.change ->
        
        pensumProcedenciaSelected = $('#relacion_pensum_procedencia_id :selected').text()
        optionsAsignaturas = $(asignaturasAProcedencia.html()).filter("optgroup[label='#{pensumProcedenciaSelected}']").html()

        if optionsAsignaturas
            asignaturasAProcedencia.empty()
            asignaturasAProcedencia.html(optionsAsignaturas)
            asignaturasAProcedencia.prop("selectedIndex", -1)
        else
            asignaturasAProcedencia.empty()

    asignaturasAProcedencia.change ->

        asignaturaAProcedenciaSelected = $('#relacion_asignatura_a_procedencia_id :selected').text()

        dataAsignaturas.each ->
            creditos = @dataAsignaturas.data('creditos')

        asignaturaAProcedenciaCreditos.html().value(asignaturaAProcedenciaSelected.creditos)

    asignaturasBProcedencia.change ->

        asignaturaBProcedenciaSelected = $('#relacion_asignatura_b_procedencia_id :selected').text()

        dataAsignaturas.each ->
            creditos = @dataAsignaturas.data('creditos')

        asignaturaBProcedenciaCreditos.html().value(asignaturaBProcedenciaSelected.creditos)


jQuery ->
  $(document).ready(fieldsControlLocal())
  $(document).ready(fieldsControlProcedencia())