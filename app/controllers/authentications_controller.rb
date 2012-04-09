class AuthenticationsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@authentications = Authentication.where(:user => current_user.to_pointer)
  end  
    
  def create  
    token = request.env["omniauth.auth"]["credentials"]["token"]
    secret = request.env["omniauth.auth"]["credentials"]["secret"]
    a = Authentication.new
    a.provider = "dropbox"
    a.token = token
    a.secret = secret
    a.user = current_user.to_pointer
    a.save
    redirect_to "/authentications"
  end  
    
  def destroy
  	@authentication = Authentication.find(params[:id])  
  	@authentication.destroy  
  	flash[:notice] = "Successfully destroyed authentication."  
  	redirect_to "/authentications"
  end

end
