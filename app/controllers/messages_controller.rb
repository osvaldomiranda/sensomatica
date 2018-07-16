class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(1)
    @message = @chatroom.messages.new(message_params)
    @message.user = current_user
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body, :chatroom_id, :user_id)
  end
end
