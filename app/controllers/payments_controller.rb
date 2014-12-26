class PaymentsController < ApplicationController
  def pay
  	Payment.find(params[:id]).pay
  	redirect_to request.referer
  end
end
