class AstronomicObject < ActiveRecord::Base

  scope :with_const, -> with_const { where(constellation: with_const) if with_const.present?}
  scope :with_catalog, -> with_catalog { where(catalog: with_catalog) if with_catalog.present?}

  def self.const_for_select
    AstronomicObject.select(:constellation).order(:constellation).distinct.map{|a| [a.constellation,a.constellation]}
  end 

  def self.catalog_for_select
    AstronomicObject.select(:catalog).order(:catalog).distinct.map{|a| [a.catalog, a.catalog]}
  end 

  ISOS  = ['100','125','160','200','250','320','400', '500', '640','800','1000','1250','1600','2000','2500','3200','4000','5000','6400','8000','10000','12800','16000','20000','25600']

  def self.camera_iso
    ISOS.each_with_index.map { |t,i| [t, i+1] }
  end 

  MOVE  = ['1°','1m','1s']
  def self.move_for_select
    MOVE.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 

  EXPTIME  = ['1 Seg','5 Seg','10 Seg','20 Seg','30 Seg','40 Seg', '50 Seg', '60 seg', '120 seg', '180 seg', '300 min']
  def self.camera_time
    EXPTIME.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 


  def type_name
    type_object = TypeObject.where(type_name: self.type_object).first
    if type_object.present?
      return type_object.name
    else
      return ''
    end  
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
