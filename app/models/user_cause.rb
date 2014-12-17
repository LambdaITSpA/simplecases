class UserCause < ActiveRecord::Base
  belongs_to :user
  belongs_to :cause
  has_many :journal_entries, dependent: :destroy
end
