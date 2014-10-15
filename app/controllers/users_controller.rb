class UsersController < ApplicationController
before_action :abc, :only=> [:update,:edit]

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
  	@user=current_user
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
