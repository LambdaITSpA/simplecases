class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.string :description
      t.string :link
      t.datetime :checked_at
      t.boolean :dismissable
      t.datetime :dismissed_at
      t.references :notification_type, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
