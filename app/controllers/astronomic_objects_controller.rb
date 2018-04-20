class AstronomicObjectsController < ApplicationController
  before_action :set_astronomic_object, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @astronomic_objects = AstronomicObject.all
    respond_with(@astronomic_objects)
  end

  def show
    respond_with(@astronomic_object)
  end

  def new
    @astronomic_object = AstronomicObject.new
    respond_with(@astronomic_object)
  end

  def edit
  end

  def create
    @astronomic_object = AstronomicObject.new(astronomic_object_params)
    @astronomic_object.save
    respond_with(@astronomic_object)
  end

  def update
    @astronomic_object.update(astronomic_object_params)
    respond_with(@astronomic_object)
  end

  def destroy
    @astronomic_object.destroy
    respond_with(@astronomic_object)
  end

  private
    def set_astronomic_object
      @astronomic_object = AstronomicObject.find(params[:id])
    end

    def astronomic_object_params
      params.require(:astronomic_object).permit(:name, :catalog, :type_object, :ra, :dec, :constellation, :bmag, :hubble)
    end
end
