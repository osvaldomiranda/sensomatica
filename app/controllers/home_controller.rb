class HomeController < ApplicationController
  def index

    @chart_data1 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).where(codigoe:'AA').limit(200).pluck(:created_at, :humedad_origen1)
    @chart_data2 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).where(codigoe:'AA').limit(200).pluck(:created_at, :humedad_origen2)
    @chart_data3 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).where(codigoe:'AA').limit(200).pluck(:created_at, :humedad_origen3)          

  
    @temperatura = 32.4
    
  end
end
