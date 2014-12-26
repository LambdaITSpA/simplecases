class Person < ActiveRecord::Base
  belongs_to :organization_client
  has_one :company
end
