class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :equipment

  mount_uploader :photo, PhotoUploader
end
