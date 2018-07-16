class CreateTypeObjects < ActiveRecord::Migration
  def change
    create_table :type_objects do |t|
      t.string :type_name
      t.string :name

      t.timestamps
    end
  end
end
