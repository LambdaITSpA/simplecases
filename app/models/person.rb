class Person < ActiveRecord::Base
  belongs_to :client
  has_one :company
end
