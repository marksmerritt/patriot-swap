class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_book, except: [:show, :edit, :update]

  def index 
    @listings = Listing.for_book(@book)
  end

  def show
    @listing = Listing.with_attached_images.find(params[:id])
    set_conversations if current_user
  end

  def new
    @listing = Listing.new
    @listing.tags.new
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

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
    @book = @listing.book
  end

  def update
    @listing = Listing.find(params[:id])
    authorize @listing

    if @listing.update(listing_params)
      flash[:success] = "Your listing has been updated successfully."
      redirect_to @listing
    else
      flash[:error] = "There was an error updating your listing. Please try again."
      render :edit
    end
  end


  private

  def listing_params
    params.require(:listing).permit(:title, :body, :condition, :price, tags_attributes: [:id, :name, :_destroy], images: [])
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
