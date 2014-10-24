class CreateCauseTypes < ActiveRecord::Migration
  def change
    create_table :cause_types do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
