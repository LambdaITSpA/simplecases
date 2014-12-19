class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :name
      t.string :long_name
      t.timestamps
    end
  end
end
