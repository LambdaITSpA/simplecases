class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :subject
      t.text :body
      t.datetime :date
      t.references :cause_state, index: true
      t.references :user_cause, index: true
      t.timestamps
    end
  end
end
