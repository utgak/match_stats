FactoryBot.define do
  factory :match do
    start_time { Faker::Date.forward.to_time }
  end
end
