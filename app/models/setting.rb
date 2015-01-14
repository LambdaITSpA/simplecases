class Setting < ActiveRecord::Base
	has_many :user_settings 
end
