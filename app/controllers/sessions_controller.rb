class SessionsController < ApplicationController

	def new

	end

	def destroy
		session.delete(:user_id)
		flash[:success] = "You are signed out!"
		redirect_to root_path
	end

	def create
		@user = User.find_by_email_and_password(params[:email],params[:password])
		if @user.present?
			session[:user_id] = @user.id
			redirect_to root_path
			flash[:success] = "You are signed in"
		else
			flash[:notice] = "Sorry, couldn't find ya"
			render 'root_path'
		end
	end
end
