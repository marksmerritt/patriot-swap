class ListingInactivationMailer < ApplicationMailer
  def email(user)
    @user = user
    # TODO: Add link to inactive listings for user to relist
    mail(to: user.email, subject: "Your listing has expired")
  end
end
