class Match < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :achievements

  def add_achievemet(name:, player:)
    self.achievements << Achievement.create(player: player, name: name)
  end
end
