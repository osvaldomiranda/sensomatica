class AddCoordToAstronomicObject < ActiveRecord::Migration
  def change
    add_column :astronomic_objects, :coord_ar, :float
    add_column :astronomic_objects, :coord_dec, :float
  end
end
