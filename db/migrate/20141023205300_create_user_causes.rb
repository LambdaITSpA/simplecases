class CreateUserCauses < ActiveRecord::Migration
  def change
    create_table :user_causes do |t|
      t.references :user, index: true
      t.references :cause, index: true

      t.timestamps
    end
  end
end
