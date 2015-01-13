class ProfilePermission < ActiveRecord::Base
  belongs_to :permission
  belongs_to :profile
end
