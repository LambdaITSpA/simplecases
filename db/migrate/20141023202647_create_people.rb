class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.text :other
      t.references :organization_client, index: true

      t.timestamps
    end
  end
end
