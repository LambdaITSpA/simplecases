class User < ActiveRecord::Base
  belongs_to :organization
  has_many :user_causes
  has_many :journal_entries
end
