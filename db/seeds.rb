5.times do
  teams = FactoryBot.create_list(:team, 2, :with_players)
  match = FactoryBot.create_list(:match, 3, teams: teams)

  match.each do |m|
    3.times do 
      m.add_achievemet(name: Faker::Emotion.adjective, player: teams.first.players.order("RANDOM()").limit(1).first )
      m.add_achievemet(name: Faker::Emotion.adjective, player: teams.last.players.order("RANDOM()").limit(1).first )
    end
  end
end
