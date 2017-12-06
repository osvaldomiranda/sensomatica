class AddConceptToReading < ActiveRecord::Migration
  def change
    add_column :readings, :humidity_concept1, :string
  end
end
