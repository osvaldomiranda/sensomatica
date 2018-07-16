class PhotoSessionsController < ApplicationController
  before_action :set_photo_session, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @photo_sessions = PhotoSession.all
    respond_with(@photo_sessions)
  end

  def show
    respond_with(@photo_session)
  end

  def new
    @photo_session = PhotoSession.new
    respond_with(@photo_session)
  end

  def edit
  end

  def create
    @photo_session = PhotoSession.new(photo_session_params)
    @photo_session.save
    respond_with(@photo_session)
  end

  def update
    @photo_session.update(photo_session_params)
    respond_with(@photo_session)
  end

  def destroy
    @photo_session.destroy
    respond_with(@photo_session)
  end

  private
    def set_photo_session
      @photo_session = PhotoSession.find(params[:id])
    end

    def photo_session_params
      params.require(:photo_session).permit([:user_id, :equipment_id]).to_h
    end
end
