class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	def index
		@events = current_user.events
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.date_time = "#{params[:date]} #{params[:time]}"
		@event.user = current_user
		@event.notified = false
		respond_to do |format|
			if @event.save
				format.html { redirect_to @event, notice: "El evento #{@event.name} ha sido creado exitosamente." }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
	  params.require(:event).permit(:name, :description, :notified, :date_time, :user_id, :cause_id)
	end
end
