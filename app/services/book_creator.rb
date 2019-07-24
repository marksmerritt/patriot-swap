require 'open-uri'

class BookCreator < ApplicationService
  def initialize(isbn)
    @isbn = isbn
  end

  def call
    @book = Book.where(isbn: @isbn).first_or_initialize do |book|
      response = BookSearch.by_isbn(@isbn).first
      set_book_attrs(book, response) if response
    end
      
    unless @book.persisted?
      if @book.save && @book.image_url
        attach_img(@book, @book.image_url)
      end
    end

    return OpenStruct.new(success?: true, book: @book) if @book.persisted?
    OpenStruct.new(success?: false, book: nil) 
  end


  private 

  def set_book_attrs(book, response)
    book.title = response.title
    book.isbn = response.isbn
    book.publisher = response.publisher
    book.authors = response.authors
    book.description = response.description
    book.image_url = response.image_link
  end

  def attach_img(book, img_url)
    book_image = open(img_url)
    book.image.attach(io: book_image, filename: "#{book.title}", content_type: book_image.content_type)
  end
end