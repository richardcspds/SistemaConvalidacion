class CreateRelacions < ActiveRecord::Migration[5.2]
  def change
    create_table :relacions do |t|
      t.integer :asignatura_home_id
      t.integer :asignatura_a_procedencia_id
      t.integer :asignatura_b_procedencia_id
      t.references :asignatura
      t.references :convalidacion

      t.timestamps
    end
  end
end
