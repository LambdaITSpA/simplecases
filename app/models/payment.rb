class Payment < ActiveRecord::Base
	belongs_to :cause
	belongs_to :payment_state
	after_update :set_cause_honorary, if: Proc.new { (self.changed & ['amount']).any? }

	def set_cause_honorary
		self.cause.generate_payments = false
		self.cause.update(honorary: self.cause.payments.sum(:amount))
	end
	# set a payment as payed
	def pay
		self.update paid_amount: self.amount, payed: true
	end
	# unpayed payments, late and not late
	def self.unpayed
		where(payed: false)
	end

	def self.payed
		where(payed: true)
	end
	# are there late payments?
	def self.late?
		self.unpayed.late.count > 0
	end
	def self.late
		where('date < ? AND payed = ?', Date.today, false)
	end 
	def self.late_in_days
		if self.days_late == 1
			"#{self.days_late} día"
		else
			"#{self.days_late} días"
		end
	end
	def self.late_amount
		self.late.sum('amount')
	end
	def self.days_late
		self.late? ? (Date.today - self.unpayed.first.date).to_i : 0
	end
	def amount_pending
		amount - paid_amount
	end
	def state
		PaymentState.find self.state_id
	end
	def state_id
		if self.payed?
			1
		else
			case
			when self.date > Date.today
				2
			when self.date == Date.today
				3
			when self.date < Date.today
				4
			end
		end
	end
end
