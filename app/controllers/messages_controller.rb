class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      broadcast_message(@message, @conversation)
      send_notification(@conversation)
    end
  end


  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def broadcast_message(message, conversation)
    ActionCable.server.broadcast "conversation_channel", body: message.body,
                                                         sender_id: message.user.id,
                                                         sender_name: message.user.first_name,
                                                         seller_id: conversation.seller_id,
                                                         buyer_id: conversation.buyer_id,
                                                         current_user_id: current_user.id
  end

  def send_notification(conversation)
    recipient = (current_user == conversation.buyer ? conversation.seller : conversation.buyer)
    NotificationCreator.call(actor: current_user, recipient: recipient, action: "message", notifiable: conversation.listing)
  end
end
