class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :id_number
      t.string :email,      null: false, default: ""
      t.string :password
      t.references :organization, index: true
      t.references :user_type, index: true
      t.references :organization_profile, index: true

      t.timestamps
    end
  end
end
