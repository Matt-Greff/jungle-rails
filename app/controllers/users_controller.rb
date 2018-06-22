class UsersController < ApplicationController

    
    def create
        @user = User.new(user_params)
        @used_email = User.where(email: @user.email).length > 1
        if @used_email
            User.find_by(@user.id).destroy
        end
        if @user.save && !@used_email
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/signup'
        end
    end
    
    def new
    end
        private

    def user_params
        params.require(:user).permit(
            :email,
            :password,
            :password_confirmation)
    end
    

end