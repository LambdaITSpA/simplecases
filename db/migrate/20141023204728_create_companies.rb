class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :email
      t.references :person, index: true
      t.references :organization_client, index: true

      t.timestamps
    end
  end
end
