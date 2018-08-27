class CreateEstudiantes < ActiveRecord::Migration[5.2]
  def change
    create_table :estudiantes do |t|
      t.string :nombres
      t.string :apellidos
      t.string :matricula
      t.string :correo
      t.string :telefono
      t.references :persona, foreign_key: true
      t.references :carrera, foreign_key: true

      t.timestamps
    end
  end
end
