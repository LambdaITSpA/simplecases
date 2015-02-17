class NotificationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_notification, only: [:show]
	def index
		@undismissed_notifications = current_user.notifications.undismissed.order :created_at
		@notifications = current_user.notifications.order :created_at
		respond_to do |format|
			format.html
			format.json
		end
	end
	def show
		@notification.dismiss
	end

	private
	def set_notification
		@notification = Notification.find(params[:id])
	end
end