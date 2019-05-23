FactoryBot.define do
  factory :course do
    code { "IT300" }
    title { "Modern Telecommunications" }
  end

  factory :second_course, class: Course do
    code { "IT414" }
    title { "Database Administration" }
  end
end
