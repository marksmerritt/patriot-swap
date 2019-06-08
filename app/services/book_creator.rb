require 'open-uri'

class BookCreator < ApplicationService
  def initialize(isbn)
    @isbn = isbn
  end

  # TODO: Add errors to result
  def call
    response = BookSearch.by_isbn(@isbn)

    if response
      response = response.first
      @book = Book.where(isbn: response.isbn).first_or_initialize do |book|
        set_book_attrs(book, response)
      end

      unless @book.persisted?
        if @book.save && response.image_link
          attach_img(@book, response.image_link)
        end
      end
    end

    return OpenStruct.new(success?: true, book: @book) if @book
    OpenStruct.new(success?: false, book: nil) 
  end


  private 

  def book_search
    BookSearch.by_isbn(@isbn)
  end

  def set_book_attrs(book, response)
    book.title = response.title
    book.isbn = response.isbn
    book.publisher = response.publisher
    book.authors = response.authors
    book.description = response.description
  end

  def attach_img(book, img_link)
    book_image = open(img_link)
    book.image.attach(io: book_image, filename: "#{book.title}", content_type: book_image.content_type)
  end
end