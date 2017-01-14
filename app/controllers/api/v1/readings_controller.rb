# encoding: utf-8
class Api::V1::ReadingsController < ApplicationController
  protect_from_forgery exception: :upload

  def upload
    puts "*****************"
    puts params
    puts "*****************"

    @msg = Readind.import(params[:file]).force_encoding('utf-8')
    if @msg == " "
      render :json=> {reading: :true} , :status => :ok
    else
      render :json=> {reading: :false} , :status => :ok
    end  
    end   
  end
end