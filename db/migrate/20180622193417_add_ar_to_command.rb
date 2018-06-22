class AddArToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :ar, :float
    add_column :commands, :dec, :float
  end
end
