#TODO: Add specs

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
      users_name = auth.info.name.split(" ")
      user = User.new(
        email: auth.info.email,
        first_name: users_name[0],
        last_name: users_name[1],
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
    end

    sign_in_and_redirect user, event: :authentication
    set_flash_message :notice, :success, kind: "Facebook"
  end

  def auth
    request.env["omniauth.auth"] 
  end
end