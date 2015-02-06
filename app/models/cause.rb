class Cause < ActiveRecord::Base
  validates :role, :matter, :client_id, :court_id, presence: true
  belongs_to :client
  belongs_to :area
  belongs_to :court
  has_many :user_causes, dependent: :destroy
  has_many :payments
  has_many :users, through: :user_causes
  after_create :set_payment_dates
  after_update :update_payment_dates
  def set_payment_dates
    if honorary and first_payment_date and fee_quantity
      self.fee_quantity.times do |quantity|
        payment_amount = self.honorary / self.fee_quantity
        payment_amount += self.honorary % self.fee_quantity if quantity == 0
        self.payments << if(self.periodicity_measure == 1)
          Payment.create(date: self.first_payment_date + (quantity*self.periodicity).month, payed: false, amount: payment_amount, paid_amount: 0, payment_number: quantity+1)
        else
          Payment.create(date: self.first_payment_date + (quantity*self.periodicity).day, payed: false, amount: payment_amount, paid_amount: 0, payment_number: quantity+1)
        end
      end
    end
  end
  def update_payment_dates 
    if self.payments.payed.count > 0
      amount_payable = self.honorary - self.payments.payed.sum('amount')
      months = self.fee_quantity - self.payments.payed.count
      self.payments.unpayed.delete_all
      months.times do |quantity|
        self.payments << Payment.create(date: self.payments.payed.last.date + (quantity + 1).month, payed: false, amount: amount_payable/months, paid_amount: 0, payment_number: self.payments.payed.count + quantity+1)
      end
    else
      self.payments.delete_all
      set_payment_dates
    end
  end

  def raw_payment(raw_payment_amount)
    self.payments.unpayed.order(:date).each do |payment|
      if payment.amount_pending <= raw_payment_amount
        raw_payment_amount -= payment.amount_pending
        payment.update paid_amount: payment.amount, payed: true
      else
        payment.update paid_amount: (payment.paid_amount + raw_payment_amount)
        break
      end
    end
  end

  def journal_entries
  	self.user_causes.first.journal_entries
  end
  def state
  	self.journal_entries.last.cause_state
  end

  def self.of_area(area_id)
    where(causes:{area_id: area_id})
  end

  def self.civil
    where(causes:{area_id:1})
  end

  def self.laboral
    where(causes:{area_id:2})
  end

  def self.cobranza
    where(causes:{area_id:3})
  end

  def self.family
    where(causes:{area_id:4})
  end

  def self.penal
    where(causes:{area_id:5})
  end

  def self.general
    where(causes:{area_id:6 })
  end
  
   def self.supr_apel
    where(causes:{area_id:7 })
  end
end