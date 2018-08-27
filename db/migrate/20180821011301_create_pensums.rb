class CreatePensums < ActiveRecord::Migration[5.2]
  def change
    create_table :pensums do |t|
      t.string :nombre
      t.date :date
      t.references :carrera, foreign_key: true

      t.timestamps
    end
  end
end
