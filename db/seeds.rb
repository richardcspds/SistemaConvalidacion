# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    universidads = Universidad.create([{nombre: 'UAPA', descripcion: 'Universidad Abierta Para Adultos'}, {nombre: 'UTESA', descripcion: 'Universidad Tecnolóogica de Santiago'}])
    
    carreras = Carrera.create([{nombre: 'Ingenieria de Software', universidad_id: '1'}, {nombre: 'Informatica Gerencial', universidad_id: '1'},\
    {nombre: 'Ingenieria en Sistemas', universidad_id: '2'}])

    pensums = Pensum.create([{nombre: 'Software 2019/1', carrera_id: '1'}, {nombre: 'Sistemas 2016/1', carrera_id: '3'}])

    asignaturas = Asignatura.create([{nombre: 'Metodología de la investigación I', clave: 'SOC112', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'}, \
    {nombre: 'Matemática Básica', clave: 'MAT111', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Medio Ambiente y Sociedad', clave: 'SOC135', creditos: '2', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Metodología de la investigación II', clave: 'SOC121', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Introducción a la Informática', clave: 'INF110', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Introducción a la Sociología', clave: 'SOC114', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Análisis Matemático 1', clave: 'MAT521', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Administración de Empresas I', clave: 'ADM101', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Ser humano y su contexto', clave: 'SOC116', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Lógica Matemática', clave: 'ISW134', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Contabilidad y Finanzas', clave: 'ISW133', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Español  I', clave: 'LEN111', creditos: '4', universidad_id: '1', carrera_id: '1', pensum_id: '1'},\
    {nombre: 'Matemática Básica', clave: 'MAT-095', creditos: '4', universidad_id: '2', carrera_id: '3', pensum_id: '2'},\
    {nombre: 'Lengua Española I', clave: 'ESP-181', creditos: '2', universidad_id: '2', carrera_id: '3', pensum_id: '2'},\
    {nombre: 'Lengua Española II', clave: 'ESP-189', creditos: '2', universidad_id: '2', carrera_id: '3', pensum_id: '2'}\
    {nombre: 'Metodología de la investigación', clave: 'SOC-116', creditos: '4', universidad_id: '2', carrera_id: '3', pensum_id: '2'}\
    {nombre: 'Introduccion a la filosofia', clave: 'SOC-180', creditos: '3', universidad_id: '2', carrera_id: '3', pensum_id: '2'}])