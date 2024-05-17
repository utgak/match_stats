require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:team) { create :team }
  let(:player_with_a_lot_of_achievements) {create :player, team: team}
  let(:player_without_achievements) {create :player, team: team}
  let(:player_with_few_achievements) {create :player, team: team}
  let(:first_match) {create(:match, start_time: DateTime.current, teams: [team])}
  let(:second_match) {create(:match, start_time: DateTime.current - 2, teams: [team])}

  before do
    create(:achievement, player: player_with_a_lot_of_achievements, match: first_match, name: 'Achievement 1')
    create(:achievement, player: player_with_a_lot_of_achievements, match: second_match, name: 'Achievement 1')
    create(:achievement, player: player_with_few_achievements, match: first_match, name: 'Achievement 1')
    create(:achievement, player: player_with_a_lot_of_achievements, match: second_match, name: 'Achievement 2')
  end

  describe '#check_achievement_in_recent_matches' do
    it 'returns true if achievement exists in recent matches' do
      expect(player_with_a_lot_of_achievements.reload.check_achievement_in_recent_matches(name: 'Achievement 1')).to be_truthy
    end

    it 'returns false if there are no achievements in recent matches' do
      expect(player_without_achievements.check_achievement_in_recent_matches(name: 'Achievement 1')).to be_falsey
    end

    it 'checks only given number of matches' do
      expect(player_with_a_lot_of_achievements.check_achievement_in_recent_matches(name: 'Achievement 2', number_of_matches: 1)).to be_falsey
    end
  end

  describe '.top_by' do
    it 'returns top player according to number of given achievement' do
      expect(Player.top_by(achievement_name: 'Achievement 1').first).to eq player_with_a_lot_of_achievements
      expect(Player.top_by(achievement_name: 'Achievement 1').last).to eq player_with_few_achievements
    end

    it 'returns given number of players' do
      number = 1
      expect(Player.top_by(achievement_name: 'Achievement 1', number_of_players: number).to_a.count).to eq number
    end
  end
end
