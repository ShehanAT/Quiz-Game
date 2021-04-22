class AddContainsImagesColumnToQuizzesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :contains_images, :integer, :default => 0
  end
end
