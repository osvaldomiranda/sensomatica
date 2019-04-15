class AddHourToReserv < ActiveRecord::Migration[5.2]
  def change
    add_column :reservs, :hour, :integer
  end
end
