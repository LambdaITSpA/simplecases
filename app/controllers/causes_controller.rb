class CausesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cause, only: [:show, :edit, :update, :destroy]

  def index
    @causes = Cause.all
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
    @cause.save
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
      params.require(:cause).permit(:id_number, :role, :court, :matter, :honorary, :client_id, :user_id, :cause_type_id)
    end
end
