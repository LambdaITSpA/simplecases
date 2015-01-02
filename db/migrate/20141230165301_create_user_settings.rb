class CreateUserSettings < ActiveRecord::Migration
  def change
    create_table :user_settings do |t|
      t.references :user, index: true
      t.references :setting, index: true
      t.boolean :enabled, default: false
      t.timestamps
    end
  end
end
