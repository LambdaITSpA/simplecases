class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name_social_reason
      t.string :company_name
      t.string :company_id_number
      t.string :address
      t.integer :phone
      t.string :email
      t.references :person, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
