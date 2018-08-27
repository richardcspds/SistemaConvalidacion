class CreateRelacions < ActiveRecord::Migration[5.2]
  def change
    create_table :relacions do |t|
      t.integer :asignatura_home
      t.integer :asignatura_proc
      t.integer :asignatura_proc_extra
      t.references :asignatura
      t.boolean :convalida

      t.timestamps
    end
  end
end
