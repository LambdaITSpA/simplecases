class Cause < ActiveRecord::Base
  validates :role, :matter, :honorary, presence: true
  belongs_to :client
  belongs_to :area
  belongs_to :court
  has_many :user_causes, dependent: :destroy
  has_many :payments
  has_many :users, through: :user_causes
  after_create :set_payment_dates
  after_update :update_payment_dates
  def set_payment_dates
    self.fee_quantity.times do |quantity|
      self.payments << Payment.create(date: self.first_payment_date + quantity.month, payed: false, amount: self.honorary/self.fee_quantity, payment_number: quantity+1)
    end
  end
  def update_payment_dates 
    if self.payments.payed.count > 0
      amount_payable = self.honorary - self.payments.payed.sum('amount')
      months = self.fee_quantity - self.payments.payed.count
      self.payments.unpayed.delete_all
      months.times do |quantity|
        self.payments << Payment.create(date: self.payments.payed.last.date + (quantity + 1).month, payed: false, amount: amount_payable/months, payment_number:  self.payments.payed.count + quantity+1)
      end
    else
      self.payments.delete_all
      set_payment_dates
    end
  end

  def journal_entries
  	self.user_causes.first.journal_entries
  end
  def state
  	self.journal_entries.last.cause_state
  end
end