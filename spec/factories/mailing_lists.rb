FactoryBot.define do
  factory :mailing_list do
    fullname Faker::Name.name
    sequence(:email) {|n| "hello-#{n}@email.com" }
  end
end
