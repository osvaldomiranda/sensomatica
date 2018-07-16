# encoding: utf-8
class Api::V1::PhotosController < ApplicationController
  protect_from_forgery exception: :upload

  def upload
    puts "*****************"
    puts params
    puts "*****************"

    photo = Photo.new
    photo.user_id = 1
    photo.photo = params[:photo]



    if photo.save
      render :json=> {photo: "OK"} , :status => :ok
      ActionCable.server.broadcast 'web_notifications_channel', message: "<p>Imagen recibida</p>"

      img_html = "<img src='#{photo.photo_url}' alt='..' height='300' width='300'>"
      ActionCable.server.broadcast 'img_notifications_channel', message: img_html

    else
      render :json=> {photo: "ERROR"} , :status => :ok
    end     
  end
end