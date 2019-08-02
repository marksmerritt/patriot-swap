class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_book, except: [:show]

  def index 
    @listings = Listing.for_book(@book)
  end

  def new
    @listing = Listing.new
    3.times { @listing.tags.build }
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
    @listing = Listing.with_attached_images.find(params[:id])
    set_conversations if current_user
  end


  private

  def listing_params
    params.require(:listing).permit(:title, :body, :condition, :price, tags_attributes: [:name], images: [])
  end

  def set_book
    @book = Book.friendly.find(params[:book_id])
  end

  # TODO: Move to service 
  def set_conversations
    if current_user == @listing.seller
      @conversations = @listing.conversations
    else
      @conversations = @listing.conversations.between(@listing.seller, current_user)
      if @conversations.empty? 
        @conversations = create_conversation
      end
    end
  end

  def create_conversation
    conversation = @listing.conversations.create(
      listing: @listing,
      seller_id: @listing.seller.id,
      buyer_id: current_user.id
    )
    @conversations = @listing.conversations.between(@listing.seller, current_user)
  end
end
