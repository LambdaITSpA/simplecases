class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = @organization.users
  end

  def home
  end

  def profile
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    params[:user][:organization_profile_id] = OrganizationProfile.find_by_organization_id_and_profile_id(@organization.id, params[:user][:organization_profile_id].to_i).id
    @user = User.new(user_params)
    @user.organization = @organization
    respond_to do |format|
      if @user.save
        format.html { redirect_to organization_user_path(@organization, @user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    params[:user][:organization_profile_id] = OrganizationProfile.find_by_organization_id_and_profile_id(@organization.id, params[:user][:organization_profile_id].to_i).id
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to organization_user_path(@organization, @user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to organization_users_url(@organization), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :id_number, :email, :password, :password_confirmation, :user_type_id, :organization_profile_id)
    end
end
