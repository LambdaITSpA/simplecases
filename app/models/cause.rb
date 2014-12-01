class Cause < ActiveRecord::Base
  validates :role, :matter, :honorary, presence: true
  belongs_to :client
  belongs_to :area
  belongs_to :court
  has_many :user_causes
  has_many :payments
  has_many :users, through: :user_causes
  after_create :set_payment_dates

  def set_payment_dates
    self.fee_quantity.times do |quantity|
      self.payments << Payment.create(date: self.first_payment_date + quantity.month, payed: false, amount: self.honorary/self.fee_quantity, payment_number: quantity+1)
    end
  end
  def journal_entries
  	self.user_causes.first.journal_entries
  end
  def state
  	self.journal_entries.last.cause_state
  end
end