class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast "conversation_channel", body: @message.body,
                                                           sender_id: @message.user.id,
                                                           sender_name: @message.user.first_name,
                                                           seller_id: @conversation.seller_id,
                                                           buyer_id: @conversation.buyer_id,
                                                           current_user_id: current_user.id

      # Send notifications
      # TODO: this does not belong here...
      recipient = (current_user == @conversation.buyer ? @conversation.seller : @conversation.buyer)
      @notification = Notification.where(recipient: recipient, 
                                        actor: current_user, 
                                        action: "message", 
                                        notifiable: @conversation.listing, 
                                        read_at: nil).first_or_initialize 
      
      
      @notification.save unless @notification.persisted?
    end
  end


  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
