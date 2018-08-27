class CreateCarreras < ActiveRecord::Migration[5.2]
  def change
    create_table :carreras do |t|
      t.string :nombre
      t.references :universidad, foreign_key: true

      t.timestamps
    end
  end
end
