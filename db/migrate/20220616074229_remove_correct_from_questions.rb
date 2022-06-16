class RemoveCorrectFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :correct, :boolean
  end
end
