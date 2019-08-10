class UserSettingsController < ApplicationController
  def toggle_email_subscription
    @user = current_user
   
    @user.update(toggle_email_subscription_params) do |u|
      u.subscribed_to_emails = params[:subscribed_to_emails]
    end

    flash["success"] = "Your settings have been updated"
    redirect_back(fallback_location: root_path)
  end

  private

  def toggle_email_subscription_params
    params.permit(:subscribed_to_emails)
  end
end