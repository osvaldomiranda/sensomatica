class AstronomicObject < ActiveRecord::Base

  scope :with_const, -> with_const { where(constellation: with_const) if with_const.present?}

  def self.const_for_select
    AstronomicObject.select(:constellation).order(:constellation).uniq.map{|a| [a.constellation,a.constellation]}
  end 

  ISOS  = ['400','600','800','1000','1200','1600', '2000', '2500']
  def self.camera_iso
    ISOS.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 

  EXPTIME  = ['1 Seg','5 Seg','10 Seg','20 Seg','30 Seg','40 Seg', '50 Seg', '60 seg', '120 seg', '180 seg', '300 min']
  def self.camera_time
    EXPTIME.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 

  def convert_coord
    ar = self.ra
    dec = self.dec

    if self.catalog=='MESSIER'
      h_ar = ar.split[0].to_f
      m_ar = ar.split[1].to_f
      
      sign = dec[0..0]
      h_dec = dec[1..2].to_f
      m_dec = dec[5..6].to_f
      
      coord_ar = h_ar + (m_ar/60) 
      coord_dec = h_dec + (m_dec/60) 
    else
      h_ar = ar[2..3].to_f
      m_ar = ar[5..6].to_f
      s_ar = ar[8..15].to_f

      sign = dec[0..0]
      h_dec = dec[1..2].to_f
      m_dec = dec[4..5].to_f
      s_dec = dec[7..20].to_f

      coord_ar = h_ar + (m_ar/60) + (s_ar/3600)
      coord_dec = h_dec + (m_dec/60) + (s_dec/3600)
    end  

    self.coord_dec = coord_dec
    self.coord_ar = coord_ar
    self.sign_dec = sign

    self.save    
  end  


end
