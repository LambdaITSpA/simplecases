class JournalEntry < ActiveRecord::Base
  belongs_to :cause_state
  belongs_to :user_cause
end
