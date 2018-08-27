class CreateConvalidacions < ActiveRecord::Migration[5.2]
  def change
    create_table :convalidacions do |t|
      t.date  :fecha_realizacion
      t.string :universidad_procedencia
      t.references :estudiante

      t.timestamps
    end
  end
end
