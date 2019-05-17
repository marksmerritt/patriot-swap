FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  
  factory :user do
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    first_name { "User" }
    last_name { "Doe" }
    confirmed_at { Date.yesterday }
  end
end
