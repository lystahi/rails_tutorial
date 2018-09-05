FactoryBot.define do
  factory :user do |u|
    u.sequence(:name) { |n| "Michael Example #{n}" }
    u.sequence(:email) { |n| "michael#{n}@example.com"}
    password  { "password" }
  end
end
