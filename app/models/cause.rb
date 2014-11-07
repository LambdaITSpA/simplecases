class Cause < ActiveRecord::Base
  belongs_to :client
  belongs_to :cause_type
  belongs_to :court
  has_many :user_causes
  has_many :user
end
