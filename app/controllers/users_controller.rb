class UsersController < ApplicationController

    # def index
    #   @user = User.last
    # end
    
    def new
      @user = User.new
    end

    # def show
    #   @user = User.find.by(sessions[:user_id])
    # end

    def create 
      @user= User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to users_tweets_path, notice: "Succesfully Logged in"
      else 
        render :new
      end
    end

    private

    def user_params 
      params.permit(:email, :password, :password_confirmation) 
    end
    
end 