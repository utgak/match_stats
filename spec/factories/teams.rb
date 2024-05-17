FactoryBot.define do
  factory :team do
    name { Faker::Team.name }

    trait :with_players do
      players {build_list(:player, 3)}
    end
  end
end
