class ListingInactivationMailer < ApplicationMailer
  def email(user)
    @user = user
    # TODO: Add link to inactive listings for user to relist
    if @user.subscribed_to_emails?
      mail(to: user.email, subject: "Your listing has expired")
    end
  end
end
