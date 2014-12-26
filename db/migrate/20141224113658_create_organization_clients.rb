class CreateOrganizationClients < ActiveRecord::Migration
  def change
    create_table :organization_clients do |t|
      t.references :client, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
