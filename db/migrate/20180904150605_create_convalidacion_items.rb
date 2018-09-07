class CreateConvalidacionItems < ActiveRecord::Migration[5.2]
  def change
    create_table :convalidacion_items do |t|
      t.references :convalidacion, foreign_key: true
      t.references :asignaturas, foreign_key: true
      t.string :asignatura_procedencia_clave
      t.string :asignatura_procedencia_nombre
      t.string :asignatura_procedencia_calificacion
      t.integer :asignatura_procedencia_creditos
      t.string :asignatura_local_clave
      t.string :asignatura_local_nombre
      t.integer :asignatura_local_creditos

      t.timestamps
    end
  end
end
