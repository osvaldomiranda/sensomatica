class AstronomicObject < ActiveRecord::Base

  scope :with_const, -> with_const { where(constellation: with_const) if with_const.present?}

  def self.const_for_select
    AstronomicObject.select(:constellation).order(:constellation).uniq.map{|a| [a.constellation,a.constellation]}
  end 

  ISOS  = ['400','600','800','1000','1200','1600', '2000', '2500']
  def self.camera_iso
    ISOS.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 

  EXPTIME  = ['1 Seg','5 Seg','10 Seg','20 Seg','30 Seg','40 Seg', '50 Seg', '1 min', '2 min', '3 min', '5 min']
  def self.camera_time
    EXPTIME.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 
  

end
