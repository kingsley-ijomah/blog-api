FactoryBot.define do
  factory :post do
    title Faker::GameOfThrones.character
    comment Faker::Lorem.sentence
    status Post.statuses[:active]
    user
  end
end