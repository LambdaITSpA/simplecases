class Subscription < ActiveRecord::Base
	belongs_to :plan
	belongs_to :organization
	has_many :invoices
	attr_accessor :paypal_payment_token, :email, :plan_length

	def discount
		if plan_length == 6
			0.05
		elsif plan_length == 12
			0.1
		else
			0
		end
	end

	def with_discount
		1 - discount
	end

	def save_with_payment
		if valid? and payment_provided?
			save_with_paypal_payment
		end
	end

	def save_with_paypal_payment
		response = paypal.make_recurring
		self.paypal_recurring_profile_token = response.profile_id
		save!
	end

	def paypal
		PaypalPayment.new(self)
	end

	def payment_provided?
		paypal_payment_token.present?
	end

	def price
		((plan.price_usd + ((user_quantity-1)*4))*with_discount).ceil
	end

	def paypal_description
		if user_quantity > 1
			"Simple Cases: plan #{plan.name} para #{user_quantity} usuarios"
		else
			"Simple Cases: plan #{plan.name} para #{user_quantity} usuario"
		end
	end
end
