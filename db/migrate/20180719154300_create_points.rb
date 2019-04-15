class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true
      t.integer :available_points
      t.integer :used_points

      t.timestamps
    end
  end
end
