class NotificationsController < ApplicationController
	def index
		@notifications = current_user.notifications.undismissed.order :created_at
		respond_to do |format|
			format.json
		end
	end
end