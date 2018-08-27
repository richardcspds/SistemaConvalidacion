class CreatePersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :personas do |t|
      t.integer :tipo
      t.text :descripcion

      t.timestamps
    end
  end
end
