class Cause < ActiveRecord::Base
  belongs_to :client
  belongs_to :cause_type
  has_many :user_cause
end
