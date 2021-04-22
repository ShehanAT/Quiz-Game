class RenameHighScoreToScoreInScores < ActiveRecord::Migration[6.0]
  def change
    rename_column :scores, :highScore, :score 
  end
end
