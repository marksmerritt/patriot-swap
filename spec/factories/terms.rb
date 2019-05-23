FactoryBot.define do
  factory :term do
    year { "2018" }
    season { 1 }
    start_date { "2018-05-21" }
    end_date { "2018-05-22" }
  end

  factory :second_term, class: Term do
    year { "2010" }
    season { 0 }
    start_date { "2019-05-21" }
    end_date { "2019-05-22" }
  end
end
