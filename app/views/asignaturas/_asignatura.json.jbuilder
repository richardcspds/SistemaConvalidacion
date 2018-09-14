json.extract! asignatura, :id, :nombre, :creditos, :universidad_id, :carrera_id,:pensum_id, :clave, :created_at, :updated_at
json.url asignatura_url(asignatura, format: :json)
