class CreateConvalidacions < ActiveRecord::Migration[5.2]
  def change
    create_table :convalidacions do |t|
      t.string :universidad_procedencia
      t.references :estudiante
      t.references :asignatura

      t.timestamps
    end
  end
end
