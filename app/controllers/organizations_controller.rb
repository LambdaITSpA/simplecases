class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    causas = Subject.find_by class_name: 'Cause'
    avances = Subject.find_by class_name: 'JournalEntry'
    pagos = Subject.find_by class_name: 'Payment'
    manage = Action.find_by name: 'manage'
    manage_causes = Permission.find_by_subject_id_and_action_id causas.id, manage.id
    manage_je = Permission.find_by_subject_id_and_action_id avances.id, manage.id
    manage_payments = Permission.find_by_subject_id_and_action_id pagos.id, manage.id

    admin = Profile.create long_name: 'Administrador', name: 'admin', permissions: [manage_causes, manage_je, manage_payments]
    lawyer = Profile.create long_name: 'Abogado', name: 'lawyer', permissions: [manage_causes, manage_je]
    executive = Profile.create long_name: 'Ejecutivo', name: 'executive', permissions: [manage_payments]

    @organization.profiles = [admin, lawyer, executive]
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :id_number)
    end
end
