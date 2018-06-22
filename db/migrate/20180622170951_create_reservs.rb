class CreateReservs < ActiveRecord::Migration
  def change
    create_table :reservs do |t|
      t.references :user, index: true
      t.date :day
      t.references :equipment, index: true
      t.integer :hours

      t.timestamps
    end
  end
end
