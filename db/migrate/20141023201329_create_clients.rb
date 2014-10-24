class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :client_type, index: true

      t.timestamps
    end
  end
end
