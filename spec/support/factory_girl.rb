require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :workout do
    sequence(:title) { |n| "The Most Awesome Workout #{n}"}
    date Date.new(2015, 1, 1)
    description 'I lifted things up and I put them down.'
    association :user
  end
end
