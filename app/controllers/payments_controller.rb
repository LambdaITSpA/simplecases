class PaymentsController < ApplicationController
  include CausesHelper
  def index
  	if query_params? :date
	  	@late_payments = query_params(:date) == 'late' ? current_user.late_payments : []
	  	@todays_payments = query_params(:date) == 'todays' ? current_user.todays_payments : []
	  	@soon_payments = query_params(:date) == 'soon' ? current_user.soon_payments.where('date < ?', Date.today + 1.month) : []
	else
		@late_payments = current_user.late_payments
	  	@todays_payments = current_user.todays_payments
	  	@soon_payments = current_user.soon_payments.where('date < ?', Date.today + 2.month)
	end
  end
  def pay
  	Payment.find(params[:id]).pay
  	redirect_to "#{request.referer}#payments"
  end
end
