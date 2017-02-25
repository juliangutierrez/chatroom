class UsersController < ApplicationController

	def index
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			session[:user_id] = @user.id
			redirect_to messages_url
		else 
			render :index
		end
	end

	def end_session
		User.find(session[:user_id]).update active: false
		session.delete :user_id
		redirect_to index
	end

	def user_params
    params.require(:user).permit(:name, :dialect)
  end
end
