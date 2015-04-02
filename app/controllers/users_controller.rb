class UsersController < ApplicationController
skip_before_filter :verify_authenticity_token

before_action :abc, :only=>[:edit]

  def new
  end

  def create
  	@user= User.find_by(session[:user_id])
  	@user.create(user_params)
  end

  def edit
  	@user= current_user

  end

  def update
    @user = User.find(session[:user_id])
  	@user.update(user_params)
    @user.save
    
  end

private

   def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:bio,:avatar)
   end

   def abc
   	@user=current_user
   end

end
