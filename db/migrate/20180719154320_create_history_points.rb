class CreateHistoryPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :history_points do |t|
      t.references :user, foreign_key: true
      t.references :reserv, foreign_key: true
      t.integer :used_points

      t.timestamps
    end
  end
end
