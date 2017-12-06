class Reading < ActiveRecord::Base
  belongs_to :equipment

  before_save :thermistor

  mount_uploader :file, FileReadingUploader

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: "ISO-8859-1" ) do |row|
      rowHash = row.to_hash

      @reading = Reading.where(file_name: rowHash["file_name"]).first
      if ! @reading.present?
      	equipment = Equipment.where(codigo: rowHash["equipment_code"])

        reading = Reading.new
        # reading.equipment = equipment
        reading.codigoe = rowHash["equipment_code"]
        reading.humedad_origen1 = rowHash["H1"]
        reading.humedad_origen2 = rowHash["H2"]
        reading.humedad_origen3 = rowHash["H3"]
        reading.temperatura_origen = rowHash["T1"]
        reading.file_name = rowHash["file_name"]

        # TO DO: agregar formula de transformación de temperaturas y humedades 
        if reading.save
        else
          puts "************************"  
          puts "************************"  
          puts   rowHash
          puts "************************"  
          puts "************************"  
        end
      end
    end    
  end   

  def thermistor 

    rawADC = self.temperatura_origen
    vo=rawADC*(5.0/4095)
    t = Math::log(10000*(5/vo-1))
    temperature = 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * t * t ))* t )
    celsius = temperature - 273.15

    self.temperatura_origen = celsius

    if(self.humedad_origen1<300)
      self.humidity_concept1 = "Sendor en Suelo Seco"
    end
      if(self.humedad_origen1<700)
        self.humidity_concept1 = "Sendor en Suelo Humedo"
      else
        self.humidity_concept1 = "Sendor en Agua"
      end
    end
  end 
end
