class CreateConvalidacions < ActiveRecord::Migration[5.2]
  def change
    create_table :convalidacions do |t|
      t.integer :universidad_home_id
      t.integer :universidad_procedencia_id
      t.integer :carrera_home_id
      t.integer :carrera_procedencia_id
      t.integer :total_creditos_home
      t.integer :total_creditos_procedencia
      t.references :convalidacion_item, foreign_key: true
      t.references :estudiante, foreign_key: true
      t.references :universidad, foreign_key: true

      t.timestamps
    end
  end
end
