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

    asignaturas = Asignatura.create([{clave: 'SOC112', nombre: 'Metodología de la investigación I', clave: 'SOC112', creditos: '4', universidad_id: '1', pensum_id: '1'}, \
    {clave: 'MAT111', nombre: 'Matemática Básica', clave: 'MAT111', creditos: '4', universidad_id: '1', pensum_id: '1'},\
    {clave: 'LEN111', nombre: 'Español  I', clave: 'LEN111', creditos: '4', universidad_id: '1', pensum_id: '1'},\
    {clave: 'MAT-095', nombre: 'Matemática Básica', clave: 'MAT-095', creditos: '4', universidad_id: '2', pensum_id: '2'},\
    {clave: 'ESP-181', nombre: 'Lengua Española I', clave: 'ESP-181', creditos: '2', universidad_id: '2', pensum_id: '2'},\
    {clave: 'ESP-189', nombre: 'Lengua Española II', clave: 'ESP-189', creditos: '2', universidad_id: '2', pensum_id: '2'}])