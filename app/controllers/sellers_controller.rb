class SellersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:q]
      @books = BookSearch.by_isbn(params[:q])
      flash[:error] = "No results" unless @books
    end
  end
end

