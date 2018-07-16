class TypeObjectsController < ApplicationController
  before_action :set_type_object, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @type_objects = TypeObject.all
    respond_with(@type_objects)
  end

  def show
    respond_with(@type_object)
  end

  def new
    @type_object = TypeObject.new
    respond_with(@type_object)
  end

  def edit
  end

  def create
    @type_object = TypeObject.new(type_object_params)
    @type_object.save
    respond_with(@type_object)
  end

  def update
    @type_object.update(type_object_params)
    respond_with(@type_object)
  end

  def destroy
    @type_object.destroy
    respond_with(@type_object)
  end

  private
    def set_type_object
      @type_object = TypeObject.find(params[:id])
    end

    def type_object_params
      params.require(:type_object).permit([:type_name, :name]).to_h
    end
end
