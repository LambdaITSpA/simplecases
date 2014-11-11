class Court < ActiveRecord::Base
  belongs_to :region
  belongs_to :court_type
  has_many :causes
end
