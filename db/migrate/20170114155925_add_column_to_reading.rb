class AddColumnToReading < ActiveRecord::Migration
  def change
    add_column :readings, :file_name, :string
    add_column :readings, :file, :string
  end
end
