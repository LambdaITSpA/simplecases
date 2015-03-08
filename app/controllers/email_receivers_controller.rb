class EmailReceiversController < ApplicationController
  def edit
  	@email_receiver = current_user.email_receiver
  end

  def new
  	@email_receiver = EmailReceiver.new
  	@email_receiver.email_receiver_method_id = 1
  	@email_receiver.authentication = 'plain'
  end

  def create
  	@email_receiver = EmailReceiver.create(email_receiver_params)
  	if @email_receiver.save
	  	@email_receiver.user = current_user
	  	current_user.update email_receiver_enabled: true
  		redirect_to user_profile_url
  	else
  		render :new
  	end
  end

  def update
  	@email_receiver = EmailReceiver.find params[:id]
  	if @email_receiver.update(email_receiver_params)
  		redirect_to user_profile_url
  	else
  		render :edit
  	end
  end

  def destroy
  	@email_receiver = EmailReceiver.find params[:id]
  	@email_receiver.destroy
  	current_user.update email_receiver_enabled: false
  	redirect_to user_profile_url
  end

  private
    def email_receiver_params
      params.require(:email_receiver).permit(:user_name, :password, :email_receiver_method_id, :address, :port, :enable_starttls_auto, :enable_ssl, :authentication, :remitter_filter, :subject_filter)
    end
end
