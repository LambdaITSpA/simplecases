class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :subject, index: true
      t.references :action, index: true

      t.timestamps
    end
  end
end
