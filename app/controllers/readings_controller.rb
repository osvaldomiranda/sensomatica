class ReadingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @readings = Reading.all.order(created_at: :desc).page(params[:page]).per_page(120)
    @chart_data1 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).pluck(:created_at, :humedad_origen1)
    @chart_data2 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).pluck(:created_at, :humedad_origen2)
    @chart_data3 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).pluck(:created_at, :humedad_origen3)          

    @chart_data4 = Reading.where("EXTRACT(MINUTE FROM created_at)=?",0).pluck(:created_at, :temperatura_origen)          


    respond_with(@readings)
  end

  def show
    respond_with(@reading)
  end

  def new
    @reading = Reading.new
    respond_with(@reading)
  end

  def edit
  end

  def create
    @reading = Reading.new(reading_params)
    @reading.save
    respond_with(@reading)
  end

  def update
    @reading.update(reading_params)
    respond_with(@reading)
  end

  def destroy
    @reading.destroy
    respond_with(@reading)
  end

  private
    def set_reading
      @reading = Reading.find(params[:id])
    end

    def reading_params
      params.require(:reading).permit(:equipment_id, :humedad_origen1, :humedad_origen2, :humedad_origen3, :temperatura_origen, :humedad1, :humedad2, :humedad3, :temperatura)
    end
end
