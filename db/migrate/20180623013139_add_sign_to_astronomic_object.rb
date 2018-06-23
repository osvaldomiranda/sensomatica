class AddSignToAstronomicObject < ActiveRecord::Migration
  def change
    add_column :astronomic_objects, :sign_dec, :string
  end
end
