class NotificationCreator < ApplicationService
  def initialize(actor:, recipient:, action:, notifiable:)
    @actor = actor
    @recipient = recipient 
    @action = action 
    @notifiable = notifiable
  end

  def call
    @notification = Notification.where(actor: @actor, 
                                       recipient: @recipient, 
                                       action: @action, 
                                       notifiable: @notifiable, 
                                       read_at: nil).first_or_initialize 
      
    
    @notification.save unless @notification.persisted?

    return OpenStruct.new(success?: true, notification: @notification) if @notification.persisted?
    OpenStruct.new(success?: false, notification: nil) 
  end
end
