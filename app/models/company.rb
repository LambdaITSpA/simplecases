class Company < ActiveRecord::Base
  has_one :person
  belongs_to :client
end
