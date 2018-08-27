json.extract! estudiante, :id, :nombre, :matricula, :correo, :telefono, :persona_id, :carrera_id, :created_at, :updated_at
json.url estudiante_url(estudiante, format: :json)
