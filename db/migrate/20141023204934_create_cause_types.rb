class CreateCauseTypes < ActiveRecord::Migration
  def change
    create_table :cause_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
