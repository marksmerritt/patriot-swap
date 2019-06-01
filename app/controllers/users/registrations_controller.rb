class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.build_location
    respond_with self.resource
  end
end