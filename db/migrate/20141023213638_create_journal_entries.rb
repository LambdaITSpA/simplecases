class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :action
      t.datetime :date
      t.references :cause_state, index: true

      t.timestamps
    end
  end
end
