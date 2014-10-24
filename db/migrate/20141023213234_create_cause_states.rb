class CreateCauseStates < ActiveRecord::Migration
  def change
    create_table :cause_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
