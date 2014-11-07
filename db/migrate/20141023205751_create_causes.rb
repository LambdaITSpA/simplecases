class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :role
      t.string :matter
      t.string :honorary
      t.datetime :date
      t.references :client, index: true
      t.references :cause_type, index: true
      t.references :court, index: true

      t.timestamps
    end
  end
end
