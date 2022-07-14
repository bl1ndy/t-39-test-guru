class AddCountdownToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :countdown, :integer, null: false, default: 0
  end
end
