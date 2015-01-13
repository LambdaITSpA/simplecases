class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.boolean :payed
      t.integer :amount
      t.integer :paid_amount
      t.integer :payment_number
      t.references :cause, index: true

      t.timestamps
    end
  end
end
