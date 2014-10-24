class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :id_numbrer
      t.string :email
      t.integer :phone
      t.string :address
      t.text :other
      t.references :client, index: true

      t.timestamps
    end
  end
end
