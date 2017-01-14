class AddColumnCodigoToReading < ActiveRecord::Migration
  def change
    add_column :readings, :codigoe, :string
  end
end
