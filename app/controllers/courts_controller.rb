class CourtsController < ApplicationController
  before_action :authenticate_user!

  def index
    @courts = Court.all
    @courts = Court.where area_id: params[:area_id] if params[:area_id]
    respond_to do |format|
      format.html
      format.json
    end
  end
end
