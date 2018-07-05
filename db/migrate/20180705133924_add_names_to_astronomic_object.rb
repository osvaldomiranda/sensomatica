class AddNamesToAstronomicObject < ActiveRecord::Migration
  def change
    add_column :astronomic_objects, :colloquial_name, :string
    add_column :astronomic_objects, :equivalence, :string
  end
end
