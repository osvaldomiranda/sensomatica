class CreateAstronomicObjects < ActiveRecord::Migration
  def change
    create_table :astronomic_objects do |t|
      t.string :name
      t.string :catalog
      t.string :type_object
      t.string :ra
      t.string :dec
      t.string :constellation
      t.float :bmag
      t.string :hubble

      t.timestamps
    end
  end
end
