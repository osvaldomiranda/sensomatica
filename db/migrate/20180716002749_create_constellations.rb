class CreateConstellations < ActiveRecord::Migration[5.2]
  def change
    create_table :constellations do |t|
      t.string :short_name
      t.string :latin_name
      t.string :spanish_name

      t.timestamps
    end
  end
end
