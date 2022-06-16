class AddForeignKeysToTestsUsers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tests_users, :users
    add_foreign_key :tests_users, :tests
  end
end
