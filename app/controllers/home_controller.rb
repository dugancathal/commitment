class HomeController < ApplicationController
  def index
    if current_user.persisted?
      redirect_to dashboard_path
      return
    end
  end
end
