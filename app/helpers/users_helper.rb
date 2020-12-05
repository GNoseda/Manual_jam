module UsersHelper
    def logged?
        session[:user_id].present? ? true : false 
    end
end
