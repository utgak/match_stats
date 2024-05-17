FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    team { build(:team) }

    trait :with_many_achievements do
      achievements {build_list(:achievement, 5, player: instance)}
    end

    trait :with_few_achievements do
      achievements {build_list(:achievement, 1, player: instance)}
    end
  end
end
