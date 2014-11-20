class Area < ActiveRecord::Base
  has_many :courts
  has_many :cases
end
