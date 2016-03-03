class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= (User.find_by(id: session[:user_id]) || NullUser.new)
  end
  helper_method :current_user

  class NullUser
    def username
      'Guest'
    end

    def token
      ''
    end
    
    def persisted?
      false
    end
  end
  private_constant :NullUser

  def authenticated?
    current_user.persisted?
  end
end
