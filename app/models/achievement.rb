class Achievement < ApplicationRecord
  belongs_to :player
  belongs_to :match
end
