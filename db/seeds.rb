require 'faker'

# Reset
Message.delete_all
Conversation.delete_all
Listing.delete_all
Book.delete_all
User.delete_all
Location.delete_all

# ------------- Create Locations -------------

location = Location.create!(
  street: "4400 University Dr",
  city: "Fairfax",
  state: "VA", 
  zip: "22030"
)

@locations = Location.all
puts "#{Location.count} locations created"

# ------------- Create Users -------------

admin_user = User.new(
  first_name: "Mark",
  last_name: "Merritt",
  email: "mark@example.com",
  password: "helloworld", 
  password_confirmation: "helloworld",
  location: @locations.sample
)

admin_user.skip_confirmation!
admin_user.save!

puts "Admin User created"

10.times do 
  u = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "helloworld", 
    password_confirmation: "helloworld",
    location: @locations.sample
  )

  u.skip_confirmation!
  u.save!
end

@users = User.all
puts "#{User.count} users created"

# ------------- Create Books -------------

20.times do 
  Book.create!(
    title: Faker::Book.title,
    isbn: Faker::Code.isbn
  )
end

@books = Book.all
puts "#{Book.count} books created"


# ------------- Tags for listings -------------

TAGS = ["IT100", "IT200", "IT300", "IT400"].freeze



# ------------- Create Listings -------------

100.times do 
  listing = Listing.new(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    seller: @users.sample,
    price_cents: Faker::Number.number(4),
    book: @books.sample, 
    condition: Faker::Number.between(0, 3)
  )

  rand(1..3).times { listing.tag_names << TAGS.sample }
  listing.save! 
end

@listings = Listing.all
puts "#{Listing.count} listings created"