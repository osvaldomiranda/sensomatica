class HomeController < ApplicationController
  def index

    @chart_data = Reading.select(:created_at, :humedad_origen1).pluck
            
            

    temp = Reading.last.temperatura_origen

    voltage = (temp * 5.0)/1024

    @temperatura = (voltage - 0.5) * 100 
  end
end
