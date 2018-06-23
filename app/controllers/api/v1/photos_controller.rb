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
    else
      render :json=> {photo: "ERROR"} , :status => :ok
    end     
  end
end