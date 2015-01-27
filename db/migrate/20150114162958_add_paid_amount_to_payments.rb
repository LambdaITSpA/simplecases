class AddPaidAmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :paid_amount, :integer
  end
end
