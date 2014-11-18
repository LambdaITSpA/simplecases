class Cause < ActiveRecord::Base
  validates :role, :matter, :honorary, presence: true
  belongs_to :client
  belongs_to :area
  belongs_to :court
  has_many :user_causes
  has_many :users, through: :user_causes
  def journal_entries
  	self.user_causes.first.journal_entries
  end
  def state
  	self.journal_entries.last.cause_state
  end
end
