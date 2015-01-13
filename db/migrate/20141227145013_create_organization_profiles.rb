class CreateOrganizationProfiles < ActiveRecord::Migration
  def change
    create_table :organization_profiles do |t|
      t.references :organization, index: true
      t.references :profile, index: true

      t.timestamps
    end
  end
end
