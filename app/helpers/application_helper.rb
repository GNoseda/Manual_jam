module ApplicationHelper
    def logged?
        session[:user_id].present? ? true : false 
    end

    def current_user
        #Si existe current user mantiene su valor
        #Caso contrario, si existe session entonces busca el usuario con el id del session y lo asigna a current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
