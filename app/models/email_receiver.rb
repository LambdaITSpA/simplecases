class EmailReceiver < ActiveRecord::Base
  belongs_to :email_receiver_method
  belongs_to :user
end
