FactoryBot.define do
  factory :conversation do
    seller_id { 1 }
    buyer_id { 2 }
    association :listing
  end
end
