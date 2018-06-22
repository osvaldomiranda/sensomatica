class CreatePhotoSessions < ActiveRecord::Migration
  def change
    create_table :photo_sessions do |t|
      t.references :user, index: true
      t.references :equipment, index: true

      t.timestamps
    end
  end
end
