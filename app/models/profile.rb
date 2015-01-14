class Profile < ActiveRecord::Base
	has_many :profile_permissions
	has_many :permissions, through: :profile_permissions
	has_many :organization_profiles
	has_many :organizations, through: :organization_profiles
end
