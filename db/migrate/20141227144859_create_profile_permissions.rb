class CreateProfilePermissions < ActiveRecord::Migration
  def change
    create_table :profile_permissions do |t|
      t.references :permission, index: true
      t.references :profile, index: true

      t.timestamps
    end
  end
end
