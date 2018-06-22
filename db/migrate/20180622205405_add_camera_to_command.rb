class AddCameraToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :exptime, :integer
    add_column :commands, :iso, :integer
  end
end
