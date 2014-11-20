class CreateCauseStates < ActiveRecord::Migration
  def change
    create_table :cause_states do |t|
      t.string :name
      t.string :color
      t.timestamps
    end
  end
end
