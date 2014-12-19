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
				unless @client.nil?
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
			@client = Client.new id_number: params[:id_number], client_type_id: params[:client_type_id]
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
	      	@person = Person.new name: params[:name].split.map(&:capitalize).join(' '), email: params[:email], phone: params[:phone], address: params[:address], other: params[:other], client: @client
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
		if params[:client_type_id].to_i == 1
			@client.person.update name: params[:name].split.map(&:capitalize).join(' '), email: params[:email], phone: params[:phone], address: params[:address], other: params[:other], client: @client
		elsif params[:client_type_id].to_i == 2
			@client.company.update name: params[:name].split.map(&:capitalize).join(' '), address: params[:address], phone: params[:phone], email: params[:email], client: @client
		end
		redirect_to @client
	end
	private
	def set_client
		@client = Client.find(params[:id])
	end
end
