class CreateEmailReceivers < ActiveRecord::Migration
  def change
    create_table :email_receivers do |t|
      t.string :address
      t.integer :port
      t.string :user_name
      t.string :password
      t.boolean :enable_starttls_auto
      t.boolean :enable_ssl
      t.string :authentication
      t.string :subject_filter
      t.string :remitter_filter
      t.string :body_filter
      t.references :email_receiver_method, index: true
      t.references :user

      t.timestamps
    end
  end
end
