class AddColumnsToRecommendations < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :user_id, :integer
    add_index :recommendations, :user_id
    add_column :recommendations, :course_id, :integer
    add_index :recommendations, :course_id
    add_column :recommendations, :expected_grade, :float
  end
end
