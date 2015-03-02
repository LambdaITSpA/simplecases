PayPal::Recurring.configure do |config|
	if Rails.env.production?
		config.sandbox = false
		config.username = 'cguerra.lambdait_api1.gmail.com'
		config.password = 'MW8T2QQ4QUNPD3HQ'
		config.signature = 'AXtUkHTVsj2j9p-wZ-cPMhz0cubTAOVZt4JL7DbEEsPrP.Vkk2B0J5io'
	else
		config.sandbox = true
		config.username = 'cguerra.lambdait-facilitator_api1.gmail.com'
		config.password = 'W7UM2XAFLUJRDYPR'
		config.signature = 'AzBpyLb0ujhTtqxMrLc8pFpBG3KeArY7MzXEIvtl3lggZk4adem7PiXV'
	end
end