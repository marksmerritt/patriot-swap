require 'faker'

# Reset
Listing.delete_all
Book.delete_all
User.delete_all
Location.delete_all

# Create Locations

location = Location.create!(
  street: "4400 University Dr",
  city: "Fairfax",
  zip: "22030",
  state: "VA"
)

@locations = Location.all
puts "#{Location.count} locations created"

# Create Users

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

# Create Books

20.times do 
  Book.create!(
    title: Faker::Book.title,
    isbn: Faker::Code.isbn
  )
end

@books = Book.all
puts "#{Book.count} books created"


# Create Listings

100.times do 
  Listing.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    seller: @users.sample,
    price_cents: Faker::Number.number(4),
    book: @books.sample
  )
end

@listings = Listing.all
puts "#{Listing.count} listings created"