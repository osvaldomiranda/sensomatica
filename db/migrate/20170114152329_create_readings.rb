class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.references :equipment, index: true
      t.integer :humedad_origen1
      t.integer :humedad_origen2
      t.integer :humedad_origen3
      t.integer :temperatura_origen
      t.decimal :humedad1
      t.decimal :humedad2
      t.decimal :humedad3
      t.decimal :temperatura

      t.timestamps
    end
  end
end
