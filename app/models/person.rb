class Person < ActiveRecord::Base
  has_one :client
  has_one :company
end
