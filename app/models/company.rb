class Company < ActiveRecord::Base
  has_one :person
  belongs_to :organization_client
end
