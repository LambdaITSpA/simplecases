class Court < ActiveRecord::Base
  belongs_to :region
  belongs_to :area
  has_many :causes
end
