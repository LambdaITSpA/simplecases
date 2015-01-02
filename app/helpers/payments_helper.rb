module PaymentsHelper
	def to_clp(amount)
		number_to_currency(amount, unit: "$", delimiter: ".", precision: 0, format: '%u %n')
	end
end
