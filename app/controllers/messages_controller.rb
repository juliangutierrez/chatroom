class MessagesController < ApplicationController

	def index
		@messages = Message.all
		@new_message = User.last.messages.build
	end

	def create
    @message = User.last.messages.build(message_params)

    if @message.save
      sync_new @message
    end

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

	private
  def message_params
    params.require(:message).permit(:content)
  end
end
