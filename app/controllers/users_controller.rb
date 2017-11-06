class UsersController < ApplicationController
    
    def edit
    @user = User.find(params[:id])
    end
    
    def show
        redirect_to root_url
    end
    
    def update
    @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Profile updated!"
          redirect_to @user
          #Handles a successful update
        else
        render 'edit'
        end
    end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
