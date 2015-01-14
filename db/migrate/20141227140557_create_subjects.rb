class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :class_name
      t.string :scope

      t.timestamps
    end
  end
end
