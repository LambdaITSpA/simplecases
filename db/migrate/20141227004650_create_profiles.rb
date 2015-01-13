class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :long_name
      t.string :name

      t.timestamps
    end
  end
end
