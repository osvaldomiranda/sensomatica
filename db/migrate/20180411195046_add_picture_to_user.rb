class AddPictureToUser < ActiveRecord::Migration
  def change
    add_column :users, :picture, :string
    add_column :users, :fullname, :string
  end
end
