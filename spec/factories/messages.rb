FactoryBot.define do
  factory :message do
    fullname Faker::Name.name
    email Faker::Internet.email
    content Faker::Lorem.sentence
  end
end
