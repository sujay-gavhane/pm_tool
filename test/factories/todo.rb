FactoryBot.define do
  factory :todo do
    title { Faker::TvShows::GameOfThrones.character }
    description { Faker::TvShows::GameOfThrones.quote }
  end
end
