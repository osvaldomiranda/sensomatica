class CommandsController < ApplicationController
  before_action :set_command, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @commands = Command.all
    respond_with(@commands)
  end

  def show
    respond_with(@command)
  end

  def new
    @command = Command.new
    respond_with(@command)
  end

  def edit
  end

  def create
    @command = Command.new(command_params)
    @command.save
    respond_with(@command)
  end

  def update
    @command.update(command_params)
    respond_with(@command)
  end

  def destroy
    @command.destroy
    respond_with(@command)
  end

  private
    def set_command
      @command = Command.find(params[:id])
    end

    def command_params
      params.require(:command).permit([:command, :type]).to_h
    end
end
