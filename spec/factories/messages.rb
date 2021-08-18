FactoryBot.define do
  factory :message do
    user { nil }
    title { "MyString" }
    content { "MyText" }
  end
end
