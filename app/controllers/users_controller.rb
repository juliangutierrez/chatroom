class UsersController < ApplicationController

	def index
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			session[:user] = @user
			redirect_to messages_url
		else 
			render :index
		end
	end

	def user_params
    params.require(:user).permit(:name)
  end
end
