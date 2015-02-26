class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date_time
      t.references :cause, index: true
      t.references :user, index: true
      t.boolean :notified

      t.timestamps
    end
  end
end
