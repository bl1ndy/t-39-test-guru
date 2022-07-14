class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url, null: false, default: ActionController::Base.helpers.image_url('default_badge.png')
      t.integer :rule, null: false, default: 0
      t.string :sub_rule

      t.timestamps
    end
  end
end
