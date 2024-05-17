class MatchesTeams < ActiveRecord::Migration[7.1]
  def change
    create_join_table :teams, :matches
  end
end
