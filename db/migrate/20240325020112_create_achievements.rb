class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.belongs_to :player
      t.belongs_to :match
      t.string :name

      t.timestamps
    end
  end
end
