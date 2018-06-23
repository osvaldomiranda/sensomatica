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

    if params[:camera].present?
      # camera_iso"=>"1600", "exp_time"=>"1_SEG
      exptime = params[:camera][:exp_time].gsub('_SEG', '')
      command = Command.new
      command.command = 'CAMERA'
      command.status = 'PENDIENTE'
      command.exptime = exptime
      command.iso = params[:camera][:camera_iso] 
      command.save
    end

    if params[:mount].present?
      # "coord_ar"=>" 04:46:25.76", "coord_dec"=>"+03:30:20.0"
      command = Command.new
      command.command = 'MOUNT'
      command.status = 'PENDIENTE'
      command.ar = params[:mount][:coord_ar] 
      command.dec = params[:mount][:coord_dec] 
      command.save
    end



    @objects = AstronomicObject.with_const(@const_name).order(:name) 
    object = @objects.first

    @object_selected = "Objeto: #{object.name}   Constelacion:#{object.constellation}   Tipo:#{object.type_object}    AR:#{object.coord_ar} DEC:#{object.sign_dec + object.coord_dec.to_s}"
    @ac_selected = object.coord_ar
    @dec_selected = object.sign_dec + object.coord_dec.to_s
    respond_with(@objects)
  end
end
