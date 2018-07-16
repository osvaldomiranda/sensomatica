# encoding: utf-8
class Api::V1::TelescopestatusController < ApplicationController
  protect_from_forgery exception: :changestatus


  def changestatus
  	status = params[:status]
  	logroom = Message.new
  	logroom.user_id = 1
  	logroom.chatroom_id = 1
  	logroom.body = status
  	logroom.save

    ActionCable.server.broadcast 'web_notifications_channel', message: "<p>#{params[:status]}</p>"

  	render :json=> {status: "OK"} , :status => :ok
  end

end  