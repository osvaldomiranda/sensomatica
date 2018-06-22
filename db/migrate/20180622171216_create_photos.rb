class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.references :equipment, index: true
      t.string :photo

      t.timestamps
    end
  end
end
