FactoryBot.define do
  factory :conversation do
    association :seller, factory: :user
    association :buyer, factory: :second_user
    association :listing
  end
end
