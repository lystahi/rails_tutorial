FactoryBot.define do
  factory :user do |u|
    u.sequence(:id) { |n| "#{n}" }    
    u.sequence(:name) { |n| "Michael Example #{n}" }
    u.sequence(:email) { |n| "michael#{n}@example.com"}
    password  { "password" }
    activated { true }
    activated_at { Time.zone.now }
  end
end