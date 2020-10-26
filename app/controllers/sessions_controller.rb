class SessionsController < ApplicationController 

    def index 
    end 

    def new 
        #find the user 
    end 

    def create 
         #find the user 
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user.id)
        else 
           flash[:message] = "Sorry, please try again"
           redirect_to login_path 
        end 
            
   
    end 

    def destroy 
        session.clear 
        redirect_to root_path 
    end 
end 