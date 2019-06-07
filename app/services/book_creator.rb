require 'open-uri'

class BookCreator < ApplicationService
  attr_reader :isbn

  def initialize(isbn)
    @isbn = isbn
  end

  def call
    response = book_search

    # TODO: Is this safe? Check for nil...add validation
    @book = Book.where(isbn: response.isbn).first_or_initialize do |book|
      book.title = response.title
      book.isbn = response.isbn
      book.publisher = response.publisher
      book.authors = response.authors
      book.description = response.description
      # TODO: ActiveStorage
    end
    attach_img(@book, response.image_link) unless @book.image.attached?
    @book.save

    @book
  end


  private 

  def book_search
    BookSearch.by_isbn(@isbn)
  end

  def attach_img(book, img_link)
    book_image = open(img_link)
    book.image.attach(io: book_image, filename: "#{book.title}", content_type: book_image.content_type)
  end
end