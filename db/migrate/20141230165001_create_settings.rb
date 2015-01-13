class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :long_name

      t.timestamps
    end
  end
end
