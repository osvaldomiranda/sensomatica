class AddPictureToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :picture, :string
  end
end
