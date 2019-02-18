FactoryBot.define do
  factory :project do
    title { Faker::TvShows::GameOfThrones.character }
    description { Faker::TvShows::GameOfThrones.quote }
  end

  factory :assigned_project, class: 'AssignedProject' do
  end
end
