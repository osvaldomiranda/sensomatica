class Equipment < ActiveRecord::Base

  mount_uploader :picture, PhotoUploader

  def self.equipment_for_select
    Equipment.order(:name).distinct.map{|a| [a.name, a.id]}
  end 
end
