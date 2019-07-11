require 'faker'

# Reset
Message.delete_all
Conversation.delete_all
Listing.delete_all
Book.delete_all
ConnectedAccount.delete_all
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
  first_name: "Admin",
  last_name: "User",
  email: "admin@example.com",
  password: "helloworld", 
  password_confirmation: "helloworld",
  location: @locations.sample
)

admin_user.skip_confirmation!
admin_user.save!

puts "Admin User created"

member_user = User.new(
  first_name: "Member",
  last_name: "User",
  email: "member@example.com",
  password: "helloworld", 
  password_confirmation: "helloworld",
  location: @locations.sample
)

member_user.skip_confirmation!
member_user.save!

member2_user = User.new(
  first_name: "Member2",
  last_name: "User",
  email: "member2@example.com",
  password: "helloworld", 
  password_confirmation: "helloworld",
  location: @locations.sample
)

member2_user.skip_confirmation!
member2_user.save!

member3_user = User.new(
  first_name: "Member3",
  last_name: "User",
  email: "member3@example.com",
  password: "helloworld", 
  password_confirmation: "helloworld",
  location: @locations.sample
)

member3_user.skip_confirmation!
member3_user.save!

puts "3 Member Users created"


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

puts "Creating listings with images..."

25.times do 
  listing = Listing.new(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    seller: @users.sample,
    price_cents: Faker::Number.number(4),
    book: @books.sample, 
    condition: Faker::Number.between(0, 3)
  )
  rand(1..4).times do
    listing.tag_names << TAGS.sample
  end

  listing.save! 

  rand(1..3).times do |i|  
    listing.images.attach(io: File.open("app/assets/images/book-placeholder.jpg"), filename: "book-placeholder-#{i}.jpg", content_type: 'image/jpg')
  end
end

@listings = Listing.all
puts "#{Listing.count} listings created"