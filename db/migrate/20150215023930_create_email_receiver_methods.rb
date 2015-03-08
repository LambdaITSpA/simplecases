class CreateEmailReceiverMethods < ActiveRecord::Migration
  def change
    create_table :email_receiver_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
