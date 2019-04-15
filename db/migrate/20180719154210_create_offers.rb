class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :equipment, foreign_key: true
      t.date :date_from
      t.date :date_end
      t.integer :ofer_price
      t.float :ofer_percent
      t.string :tite1
      t.text :body

      t.timestamps
    end
  end
end
