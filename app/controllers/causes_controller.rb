class CausesController < ApplicationController
  include CausesHelper
  before_action :authenticate_user!
  before_action :set_cause, only: [:show, :edit, :update, :destroy, :raw_payment]

  def index
    @causes = if query_params? :area
      current_user.organization.causes.of_area(query_params(:area).to_i).order(:court_id)
    else
      current_user.organization.causes.order(:court_id)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def raw_payment
    params[:raw_payment_amount] ||= 0
    @cause.raw_payment params[:raw_payment_amount].to_i
    redirect_to "#{request.referer}#payments"
  end

  def show
  end

  def new
    @cause = Cause.new
    @cause.periodicity = 1
  end

  def edit
  end

  def create
    @cause = Cause.new(cause_params)
    @cause.users << current_user
    respond_to do |format|
      if @cause.save
        je = JournalEntry.create subject: 'Inicio Causa', body: 'Se da inicio a una nueva Causa.', cause_state: CauseState.find(1), date: Time.now
        @cause.user_causes.first.journal_entries << je
        format.html { redirect_to @cause, notice: "La causa #{@cause.matter} ha sido creada exitosamente." }
        format.json { render :show, status: :created, location: @cause }
      else
        format.html { render :new }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @cause.update(cause_params)
      redirect_to @cause
    else
      render :edit
    end
  end

  def destroy
    @cause.destroy
    redirect_to causes_path
  end

  private
    def set_cause
      @cause = Cause.find(params[:id])
    end

    def cause_params
      params.require(:cause).permit(:role, :court_id, :matter, :honorary, :first_payment_date, :fee_quantity, :client_id, :area_id, :periodicity, :periodicity_measure)
    end
end
