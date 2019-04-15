class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  respond_to :html

  def edit
  end

  def update
    if params["user"].present?
      @user.picture = params["user"]["picture"]
      @user.save
    end  
    redirect_to dashboard_index_path
  end

  private
    def set_user
      @user = current_user
    end

    def photo_params
      params.require(:user).permit([:picture]).to_h
    end
end
