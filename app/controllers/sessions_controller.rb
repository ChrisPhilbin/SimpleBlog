class SessionsController < ApplicationController
    
    def new
    end

    def create
        reset_session
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Logged in!"
            log_in user
            redirect_to root_url
        else
            flash[:danger] = "Incorrect login credentials!"
            redirect_to login_path
        end
    end
    
    def destroy
     log_out
     reset_session
     redirect_to root_url
    end
    
end
