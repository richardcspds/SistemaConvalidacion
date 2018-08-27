class CreateAsignaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :asignaturas do |t|
      t.string :nombre
      t.string :clave
      t.integer :creditos
      t.references :universidad, foreign_key: true
      t.references :carrera, foreign_key:true
      t.references :pensum, foreign_key: true

      t.timestamps
    end
  end
end
