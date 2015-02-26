class SubscriptionsController < ApplicationController
	def new
		@plan = Plan.find(params[:plan_id])
		@subscription = Subscription.new
		@subscription.user_quantity = params[:user_qty].to_i
		@subscription.plan_length = params[:plan_length].to_i
		@subscription.plan = @plan
		if params[:PayerID]
			@subscription.paypal_customer_token = params[:PayerID]
			@subscription.paypal_payment_token = params[:token]
			@subscription.email = @subscription.paypal.checkout_details.email
		end
	end

	def paypal_checkout
		plan = Plan.find(params[:plan_id])
		subscription = plan.subscriptions.build
		subscription.user_quantity = params[:user_qty].to_i
		subscription.plan_length = params[:plan_length].to_i
		redirect_to subscription.paypal.checkout_url(
			return_url: new_subscription_url(plan_id: plan.id, plan_length: subscription.plan_length, user_qty: subscription.user_quantity),
			cancel_url: root_url)
	end

	def create
		#raise params[:subscription].inspect
		@subscription = Subscription.new(subscription_params)
		if @subscription.save_with_payment
			user = if User.exists? email: @subscription.email
				User.find_by email: @subscription.email
			else
				User.create!(name: params[:name], email: @subscription.email, password: params[:password])
			end
			organization = Organization.create(name: params[:organization_name])
			organization.set_profiles
			organization.subscriptions << @subscription
			organization.save
			user.organization_profile = organization.op
			user.save
			organization.users << user
			redirect_to @subscription, :notice => "Tu cuenta ha sido creada, bienvenido!"
			#redirect_to users_complete_invitee_profile_url(u: user.id)
			#redirect_to root_url
		else
			render :new
		end
	end

	def show
		@subscription = Subscription.find(params[:id])
	end

	def subscription_params
		params.require(:subscription).permit(:email, :plan_id, :plan_length, :user_quantity, :paypal_customer_token, :paypal_payment_token)
	end
end