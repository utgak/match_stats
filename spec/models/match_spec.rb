require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:team) {create :team}
  let(:player) {create :player, team: team}
  let(:match) {create :match}
  
  describe '#add_achievemet' do
    it 'adds achievement to match' do
      expect {match.add_achievemet(name: "new achiewement", player: player) }.to change { Achievement.count }
    end
  end
end
