class Notification < ActiveRecord::Base
  belongs_to :notification_type
  belongs_to :user

  def dismiss
  	if self.dismissable?
	  	self.update dismissed_at: Time.zone.now
	else
		self.update checked_at: Time.zone.now
	end
  end

  def dismiss!
  	self.update dismissed_at: Time.zone.now, checked_at: Time.zone.now
  end

  def emit(message = self)
    $redis.publish 'rt-change', message.to_json
  end

  def self.undismissed
  	where(dismissed_at: nil)
  end
end
