class MessagesController < ApplicationController
	def index
		@messages = Message.all
		@new_message = session[:user].messages.build(message_params)
	end

	def create
    @message = session[:user].messages.build(message_params)
    @message.save
    respond_with { @message }
  end

	private
  def message_params
    params.require(:message).permit(:content)
  end
end
