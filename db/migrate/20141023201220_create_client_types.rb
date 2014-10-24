class CreateClientTypes < ActiveRecord::Migration
  def change
    create_table :client_types do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
