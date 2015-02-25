class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_quantity
      t.references :plan, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
