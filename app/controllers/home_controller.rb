class HomeController < ApplicationController
  def index

    @chart_data = Reading.sum(:humedad_origen1).group(:created_at)
            
            

    temp = Reading.last.temperatura_origen

    voltage = (temp * 5.0)/1024

    @temperatura = (voltage - 0.5) * 100 
  end
end
