class Permission < ActiveRecord::Base
  belongs_to :subject
  belongs_to :action
  has_many :profile_permissions
  has_many :profiles, through: :profile_permissions
end
