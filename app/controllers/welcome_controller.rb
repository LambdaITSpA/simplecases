class WelcomeController < ApplicationController
  layout 'landing'
  def index
  end
  def contact
  	WelcomeMailer.contact(params[:contact_name], params[:contact_email], params[:contact_body]).deliver
  	redirect_to root_url
  end
  def get_plan
  	
  end
end
