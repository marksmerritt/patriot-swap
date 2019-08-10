FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  # sequence :phone do |n|
  #   "1804555#{4.times.map { rand(0..10) }.join}"
  # end
  
  factory :user do
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    first_name { "User" }
    last_name { "Doe" }
    phone { ENV["MY_PHONE_NUMBER"] }
    confirmed_at { Date.yesterday }
    association :location
  end

  factory :second_user, class: User do
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    first_name { "User" }
    last_name { "Smith" }
    phone { ENV["MY_PHONE_NUMBER"] }
    confirmed_at { Date.yesterday }
    association :location
  end

  factory :subscribed_user, class: User do
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    first_name { "User" }
    last_name { "Doe" }
    phone { ENV["MY_PHONE_NUMBER"] }
    confirmed_at { Date.yesterday }
    association :location
  end
end
