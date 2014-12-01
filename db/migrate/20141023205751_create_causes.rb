class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :role
      t.string :matter
      t.integer :honorary
      t.datetime :start_date
      t.datetime :first_payment_date
      t.integer :fee_quantity
      t.references :client, index: true
      t.references :area, index: true
      t.references :court, index: true

      t.timestamps
    end
  end
end
