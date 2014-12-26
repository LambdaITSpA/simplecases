class OrganizationClient < ActiveRecord::Base
  belongs_to :organization
  belongs_to :client
  has_one :company
  has_one :person
end
