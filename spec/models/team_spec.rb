require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) {create :team}
  let(:player_with_a_lot_of_achievements) {create :player, team: team}
  let(:player_with_few_achievements) {create :player, team: team}
  let(:match) {create :match, teams: [team]}
  let(:achievement_name) {'Achievement'}
  
  
  before do
    create(:achievement, player: player_with_a_lot_of_achievements, match: match, name: achievement_name)
    create(:achievement, player: player_with_few_achievements, match: match, name: achievement_name)
    create(:achievement, player: player_with_a_lot_of_achievements, match: match, name: achievement_name)
  end

  describe '#top_players_by' do
    it 'returns top players according to number of achievements by achievement name' do
      expect(team.top_players_by(achievement_name: achievement_name).first).to eq player_with_a_lot_of_achievements
      expect(team.top_players_by(achievement_name: achievement_name).last).to eq player_with_few_achievements
    end

    it 'returns given number of players' do
      number = 1
      expect(team.top_players_by(achievement_name: achievement_name, number_of_players: number).to_a.count).to eq number
    end
  end
end
