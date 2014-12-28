class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization
  belongs_to :profile
  has_many :users
end
