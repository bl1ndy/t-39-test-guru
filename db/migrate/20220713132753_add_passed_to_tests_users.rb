class AddPassedToTestsUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :tests_users, :passed, :boolean, default: false
  end
end
