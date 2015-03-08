class CreateNotificationTypes < ActiveRecord::Migration
  def change
    create_table :notification_types do |t|
      t.string :name
      t.string :long_name
      t.string :color
      t.string :icon

      t.timestamps
    end
  end
end
