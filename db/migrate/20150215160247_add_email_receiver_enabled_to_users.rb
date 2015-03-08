class AddEmailReceiverEnabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_receiver_enabled, :boolean
  end
end
