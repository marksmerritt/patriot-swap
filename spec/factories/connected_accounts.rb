FactoryBot.define do
  factory :connected_account do
    user { nil }
    provider { "MyString" }
    uid { "MyString" }
    access_token { "MyString" }
    access_token_secret { "MyString" }
    refresh_token { "MyString" }
    expires_at { "2019-07-04 21:15:09" }
    auth { "MyText" }
  end
end
