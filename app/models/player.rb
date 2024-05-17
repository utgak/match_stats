class Player < ApplicationRecord
  has_many :achievements
  belongs_to :team

  scope :order_by_achievement, ->(name) do
    joins(:achievements).where(achievements: {name: name}).
      group(:id).order('COUNT(achievements.id) DESC')
  end

  def check_achievement_in_recent_matches(name:, number_of_matches: 5)
    last_matches = team.matches.order(start_time: :desc).limit(number_of_matches).pluck(:id)
    achievements.where(match_id: last_matches, name: name).exists?
  end

  def self.top_by(achievement_name:, number_of_players: 5)
    order_by_achievement(achievement_name).limit(number_of_players)
  end
end
