class ControlController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def index
    if params[:const].present?
      @const_name = params[:const]
    else
      if params[:mount].present?
        @const_name = params[:mount][:const]
      else
        if params[:camera].present?
          @const_name = params[:camera][:const]
        else  
          @const_name = 'Ori'
        end  
      end
    end    
    @objects = AstronomicObject.with_const(@const_name).order(:name) 
    object = @objects.first

    @object_selected = "Objeto: #{object.name}   Constelacion:#{object.constellation}   Tipo:#{object.type_object}    AR:#{object.ra} DEC:#{object.dec}"
    @ac_selected = object.ra
    @dec_selected = object.dec
    respond_with(@objects)
  end
end
