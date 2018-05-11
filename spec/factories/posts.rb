FactoryBot.define do
  factory :post do
    title Faker::GameOfThrones.character
    comment Faker::Lorem.sentence
    status Post.statuses[:active]
    user
    image nil
    tag_ids { [FactoryBot.create(:tag).id] } # curly brackets is necessary to eval at runtime
  end
end