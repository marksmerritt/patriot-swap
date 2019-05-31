class BooksController < ApplicationController
  def index 
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, success: "Book saved successfully!"
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :tags_as_string)
  end
end
