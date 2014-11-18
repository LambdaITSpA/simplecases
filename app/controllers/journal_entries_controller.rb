class JournalEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_cause

  def index
    @journal_entries = @cause.journal_entries#JournalEntry.all
  end

  def show
  end

  def new
    @journal_entry = JournalEntry.new
  end

  def edit
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.save
    @cause.journal_entries << @journal_entry
    redirect_to cause_url(@cause)
  end

  def update
    @journal_entry.update(journal_entry_params)
    redirect_to cause_url(@cause)
  end

  def destroy
    @journal_entry.destroy
    redirect_to cause_url(@cause)
  end

  private
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    def set_cause
      @cause = Cause.find(params[:cause_id])
    end

    def journal_entry_params
      params.require(:journal_entry).permit(:subject, :body, :date, :cause_state_id)
    end
end
