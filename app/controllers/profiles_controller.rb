class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_organization, only: [:index, :destroy, :edit, :update, :show]
	before_action :set_profile, only: [:destroy, :edit, :update, :show]
	def index
	end
	def edit
	end
	def update
		@profile.update(profile_params)
		redirect_to organization_profiles_url(@organization)
	end
	def destroy
		@profile.destroy
		redirect_to organization_profiles_url(@organization)
	end
	def show
	end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end
    def set_profile
    	@profile = Profile.find params[:id]
    end
    def profile_params
    	params.require(:profile).permit(:name, :long_name)
    end
end