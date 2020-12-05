class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private

    def require_login
      if not helpers.logged?
        redirect_to new_session_path, notice: "You must be logged to continue" 
      end
    end
end
