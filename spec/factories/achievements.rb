FactoryBot.define do
  factory :achievement do
    name { Faker::Emotion.adjective }
    match { build(:match) }
    player { build(:player) }
  end
end
