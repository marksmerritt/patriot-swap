class SellersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # TODO: Move to results page
    @book = BookCreator.call(params[:q]) if params[:q]
  end
end

