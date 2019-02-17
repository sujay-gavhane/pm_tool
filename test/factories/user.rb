FactoryBot.define do
  factory :user do
    first_name { Faker::TvShows::GameOfThrones.character }
    last_name { Faker::TvShows::GameOfThrones.quote }
    sequence(:email) { |n| "test_admin#{n}@test.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
  end
end
