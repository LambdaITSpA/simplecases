class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update]
	def index
		@clients = current_user.organization.clients
		respond_to do |format|
			format.html
			unless params[:id_number]
				format.json
			else
				@client = Client.find_by id_number: params[:id_number] if params[:id_number]
				organization_client = @client.org_client_by_id current_user.organization.id
				unless @client.nil? or organization_client.nil?
					format.json { render json: @client, status: :ok, location: @client}
				else
					format.json { render json: [], status: 404}
				end
			end
		end
	end

	def show
		respond_to do |format|
			format.html
			format.json
		end
	end

	def new
		
	end

	def create
		if params[:client_type_id].to_i == 2
			@client = Client.find_by(id_number: params[:id_number]) || Client.new(id_number: params[:id_number], client_type_id: params[:client_type_id])
			@company = Company.new name: params[:name].split.map(&:capitalize).join(' '), address: params[:address], phone: params[:phone], email: params[:email], client: @client

			respond_to do |format|
				if @client.save and @company.save
					@notice = 'Empresa creada exitosamente.'
					format.html { redirect_to new_client_path, notice: @notice }
					format.json { render :show, status: :created, location: @client }
				else
					format.html { render :new }
					format.json { render json: @client.errors, status: :unprocessable_entity }
				end
		    end
		elsif params[:client_type_id].to_i == 1
			@client = Client.new id_number: params[:id_number], client_type_id: params[:client_type_id]
			@organization_client = OrganizationClient.create client: @client, organization: current_user.organization
	      	@person = Person.new name: params[:name].split.map(&:capitalize).join(' '), email: params[:email], phone: params[:phone], address: params[:address], other: params[:other], organization_client_id: @organization_client.id
	      	respond_to do |format|
				if @client.save and @person.save
					@notice = 'Persona creada exitosamente.'
					format.html { redirect_to new_client_path, notice: @notice }
					format.json { render :show, status: :created, location: @client }
				else
					format.html { render :new }
					format.json { render json: @client.errors, status: :unprocessable_entity }
				end
		    end
    	end					
	end
	def update
		@client.update id_number: params[:id_number], client_type_id: params[:client_type_id]
		@client.data(current_user.organization.id).update name: params[:name].split.map(&:capitalize).join(' '), email: params[:email], phone: params[:phone], address: params[:address], other: params[:other]
		redirect_to @client
	end
	private
	def set_client
		@client = Client.find(params[:id])
	end
end
