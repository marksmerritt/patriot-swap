# Reset
User.delete_all



# Create Users

admin_user = User.new(
  first_name: "Mark",
  last_name: "Merritt",
  email: "mark@example.com",
  password: "helloworld", 
  password_confirmation: "helloworld"
)

admin_user.skip_confirmation!
admin_user.save!

puts "Admin User created"