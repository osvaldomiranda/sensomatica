class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :command
      t.string :type

      t.timestamps
    end
  end
end
