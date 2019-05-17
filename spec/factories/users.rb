FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    first_name { "User" }
    last_name { "Doe" }
  end
end
