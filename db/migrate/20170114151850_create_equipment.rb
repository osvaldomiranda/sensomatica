class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :codigo
      t.string :nombre
      t.text :descripcion
      t.text :caracteristicas

      t.timestamps
    end
  end
end
