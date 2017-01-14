class Reading < ActiveRecord::Base
  belongs_to :equipment

  mount_uploader :file, FileReadingUploader

  def self.import(file)
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: "ISO-8859-1" ) do |row|
      rowHash = row.to_hash
      @reading = Reading.where(file_name: rowHash["file_name"]).first
      if ! @reading.present?
      	equipment = Equipment.where(codigo: rowHash["equipment_code"])

        reading = Reading.new
        reading.equipment = equipment
        reading.codigo = rowHash["equipment_code"]
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
end
