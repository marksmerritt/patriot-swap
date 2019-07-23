#TODO: Add specs
require "open-uri"
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    service = ConnectedAccount.where(provider: auth.provider, uid: auth.uid).first

    if service.present?
      user = service.user 
      service.update(
        expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token
      )
    else
      user_fullname = auth.info.name.split(" ")
      user = User.new(
        email: auth.info.email,
        first_name: user_fullname[0],
        last_name: user_fullname[1],
        password: Devise.friendly_token[0,20]
      )
      user.skip_confirmation!
      user.save

      user.connected_accounts.create(
        provider: auth.provider,
        uid: auth.uid,
        expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token
      )

      # TODO: Move to background job
      profile_picture = open(auth.info.image)
      user.avatar.attach(io: profile_picture, filename: "avatar#{user.id}.jpg", content_type: profile_picture.content_type)
    end

    sign_in_and_redirect user, event: :authentication
    set_flash_message :notice, :success, kind: "Facebook"
  end

  def auth
    request.env["omniauth.auth"] 
  end
end