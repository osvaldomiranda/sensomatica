class HomeController < ApplicationController
  
  def index
  	if params[:locale].present?
  	  I18n.default_locale = params[:locale]
    end

    if current_user.present?
      redirect_to dashboard_index_path
    end      
  end

end
