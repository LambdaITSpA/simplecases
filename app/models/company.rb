class Company < ActiveRecord::Base
  has_one :person
  has_one :client
end
