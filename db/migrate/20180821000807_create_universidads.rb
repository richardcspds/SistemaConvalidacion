class CreateUniversidads < ActiveRecord::Migration[5.2]
  def change
    create_table :universidads do |t|
      t.string :nombre
      t.text :descripcion
      t.string :logo

      t.timestamps
    end
  end
end
