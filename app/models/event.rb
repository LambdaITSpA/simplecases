class Event < ActiveRecord::Base
  validates :name, :description, :date_time, presence: true
  belongs_to :cause
  belongs_to :user
end
