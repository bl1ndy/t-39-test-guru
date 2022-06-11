class AddCorrectToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :correct, :boolean, default: false
  end
end
