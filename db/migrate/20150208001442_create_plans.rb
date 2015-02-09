class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.boolean :causes
      t.boolean :payments
      t.boolean :clients
      t.integer :price_clp
      t.integer :price_usd

      t.timestamps
    end
  end
end
