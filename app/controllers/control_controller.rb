class ControlController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    
    if params[:const].present?
      @const_name = params[:const]
      @catalog = params[:catalog]
    else
      if params[:mount].present?
        @const_name = params[:mount][:const]
        @catalog = params[:mount][:catalog]
      else
        if params[:camera].present?
          @const_name = params[:camera][:const]
          @catalog = params[:camera][:catalog]
        else  
          @const_name = 'Ori'
          if params[:catalog].present?
            @catalog = params[:catalog]
          else  
            @catalog = 'NGC'
          end
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

    @objects = AstronomicObject.with_const(@const_name).with_catalog(@catalog).order(:name) 
    object = @objects.first
    if params[:object].present?
      object = AstronomicObject.where(id: params[:object]).first
    end  


    @object_selected = object

    if object.catalog == 'SolarSistem'
      coords = `python ./planeta.py -o #{object.name} -d #{DateTime.now.strftime("%Y/%m/%dt%H:%M:%S") }`
      
      object.ra = coords.split[0]
      object.dec = coords.split[1]

       h_ra = object.ra.split(':')[0].to_f
       m_ra = object.ra.split(':')[1].to_f
       s_ra = object.ra.split(':')[2].to_f

       h_dec = object.dec.split(':')[0].to_f
       m_dec = object.dec.split(':')[1].to_f
       s_dec = object.dec.split(':')[2].to_f

       if h_dec < 0.0
        sign = '-'
        h_dec = h_dec * -1
       else
        sign = '+'  
       end

      @ac_selected  = (h_ra + (m_ra/60) + (s_ra/3600)).to_s
      @dec_selected = sign + (h_dec + (m_dec/60) + (s_dec/3600)).to_s
    else  
      @ac_selected = object.coord_ar
      @dec_selected = object.sign_dec + object.coord_dec.to_s
    end  
    respond_with(@objects)
  end



end
