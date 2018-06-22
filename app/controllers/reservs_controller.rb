class ReservsController < ApplicationController
  before_action :set_reserv, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reservs = Reserv.all
    respond_with(@reservs)
  end

  def show
    respond_with(@reserv)
  end

  def new
    @reserv = Reserv.new
    respond_with(@reserv)
  end

  def edit
  end

  def create
    @reserv = Reserv.new(reserv_params)
    @reserv.save
    respond_with(@reserv)
  end

  def update
    @reserv.update(reserv_params)
    respond_with(@reserv)
  end

  def destroy
    @reserv.destroy
    respond_with(@reserv)
  end

  private
    def set_reserv
      @reserv = Reserv.find(params[:id])
    end

    def reserv_params
      params.require(:reserv).permit(:user_id, :day, :equipment_id, :hours)
    end
end
