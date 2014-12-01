class CreatePaymentStates < ActiveRecord::Migration
  def change
    create_table :payment_states do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
