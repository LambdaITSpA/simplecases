class CausesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cause, only: [:show, :edit, :update, :destroy]

  def index
    @causes = Cause.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @cause = Cause.new
  end

  def edit
  end

  def create
    @cause = Cause.new(cause_params)
    @cause.users << current_user
    respond_to do |format|
      if @cause.save
        je = JournalEntry.create subject: '1', body: '1', cause_state: CauseState.find(1), date: Time.now
        @cause.user_causes.first.journal_entries << je
        format.html { redirect_to @cause, notice: 'Cause was successfully created.' }
        format.json { render :show, status: :created, location: @cause }
      else
        format.html { render :new }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cause.update(cause_params)
  end

  def destroy
    @cause.destroy
  end

  private
    def set_cause
      @cause = Cause.find(params[:id])
    end

    def cause_params
      params.require(:cause).permit(:role, :court_id, :matter, :honorary, :client_id, :area_id)
    end
end
