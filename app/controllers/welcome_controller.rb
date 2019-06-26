class WelcomeController < ApplicationController
  def index
    redirect_to buyers_path(q: params[:q]) if params[:q]
  end
end
