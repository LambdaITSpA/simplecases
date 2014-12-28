class ProfilesController < ApplicationController
	before_action :set_organization, only: [:index]
	def index
	end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end
end