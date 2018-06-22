# encoding: utf-8
class Api::V1::CommandController < ApplicationController
  protect_from_forgery exception: :getcommand

  def getcommand
    puts "*****************"
    puts params
    puts "*****************"

    command = Command.where(status:'PENDIENTE').first

    if command.present?
      render :json=> {command: command} , :status => :ok
    else
      render :json=> {command: " "} , :status => :ok
    end     
  end
end