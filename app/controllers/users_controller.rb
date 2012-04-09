class UsersController < ApplicationController
  def new  
    @user = User.new  
  end  

  def create
    @user = User.new(params[:user])
    
    if @user.valid? 
      user = User.where(:username => params[:user][:username])
      if user.length > 0
        @user.errors[:username] << "is already taken."
        render "new"
        return
      end
      
      # prevents password_confirmation from
      # getting saved as plaintext in Parse
      params[:user].delete(:password_confirmation)
      @user = User.new(params[:user])
      @user.save
      session[:user_id] = @user.id  
      redirect_to "/authentications", :notice => "Signed up! Logged in!"
    else
      render "new"
    end
  end
end