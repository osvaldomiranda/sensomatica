class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :equipment

  mount_uploader :photo, PhotoUploader

  def self.sessions(user)
  	Photo.select("created_at::timestamp::date").where(user_id: user).distinct.pluck("created_at::timestamp::date")
  end

  def self.photos_x_sesion(date)
  	Photo.where("created_at::timestamp::date = ?", date)
  end	

end
