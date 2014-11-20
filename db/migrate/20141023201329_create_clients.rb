class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :id_number
      t.references :client_type, index: true

      t.timestamps
    end
  end
end
