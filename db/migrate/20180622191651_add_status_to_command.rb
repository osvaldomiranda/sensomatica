class AddStatusToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :status, :string
  end
end
