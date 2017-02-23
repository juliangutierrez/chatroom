class MessagesController < ApplicationController
	respond_to :html, :js
	
	def index
		@messages = Message.all
		@new_message = User.last.messages.build
	end

	def create
    @message = User.last.messages.build(message_params)
    @message.save
    respond_with { @message }
  end

	private
  def message_params
    params.require(:message).permit(:content)
  end
end
