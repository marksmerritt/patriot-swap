class SellersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:q]
      @book = BookCreator.call(params[:q]).book

      unless @book 
        flash[:error] = "No results...double check the ISBN or create a manual listing"
      end
    end
  end
end

