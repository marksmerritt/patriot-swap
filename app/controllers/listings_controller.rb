class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_book, except: [:show]

  def index 
    @listings = Listing.for_book(@book)
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.seller = current_user
    @listing.book = @book

    if @listing.save
      redirect_to @listing, success: "Listing created successfully"
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
    set_conversations
  end


  private

  def listing_params
    params.require(:listing).permit(:title, :body, :price_cents, :tags_as_string, images: [])
  end

  def set_book
    @book = Book.friendly.find(params[:book_id])
  end

  def set_conversations
    if current_user == @listing.seller
      @conversations = @listing.conversations
    else
      @conversations = @listing.conversations.between(@listing.seller, current_user)
    end
  end
end
