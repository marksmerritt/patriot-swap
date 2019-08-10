class TwilioClient
  def initialize(user, message)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @user = user
    @message = message
  end

  def send_text
    @client.api.account.messages.create(
      to: @user.phone,
      from: phone_number,
      body: @message
    )
  end


  private 


  def account_sid
    ENV["TWILIO_ACCOUNT_SID"]
  end

  def auth_token
    ENV["TWILIO_AUTH_TOKEN"]
  end

  def phone_number
    ENV["TWILIO_NUMBER"]
  end
end