class Team < ApplicationRecord
  has_and_belongs_to_many :matches
  has_many :players

  def top_players_by(achievement_name:, number_of_players: 5)
    players.order_by_achievement(achievement_name).limit(number_of_players)
  end
end
