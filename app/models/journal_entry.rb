class JournalEntry < ActiveRecord::Base
	validates :subject, :body, presence: true
  belongs_to :cause_state
  belongs_to :user_cause
  def cause
  	self.user_cause.cause
  end
end
