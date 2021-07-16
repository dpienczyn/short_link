FactoryBot.define do
  factory :link do
    url { Faker::Internet.unique.url }
  end
end
