FactoryBot.define do
  factory :comment do
    fullname Faker::Name.name 
    content Faker::Lorem.sentence
    status Post.statuses[:active]
    post
  end
end
