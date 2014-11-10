class ClientsController < ApplicationController

	def new
		
	end

	def create
		if params[:client_type_id].to_i == 2
			@client= Client.new id_number: params[:id_number], client_type_id: params[:client_type_id]
			@company= Company.new name: params[:name], address: params[:address], phone: params[:phone], email: params[:email], client: @client

			respond_to do |format|
				if @client.save and @company.save
					format.html { redirect_to new_client_path, notice: 'Empresa creada exitosamente.' }
					#format.json { render :show, status: :created, location: @organization }
				else
					format.html { render :new }
					#format.json { render json: @organization.errors, status: :unprocessable_entity }
				end
		    end
		elsif params[:client_type_id].to_i == 1
			@client= Client.new id_number: params[:id_number], client_type_id: params[:client_type_id]
	      	@person= Person.new name: params[:name], email: params[:email], phone: params[:phone], address: params[:address], other: params[:other], client: @client
	      	respond_to do |format|
				if @client.save and @person.save
					format.html { redirect_to new_client_path, notice: 'Persona creada exitosamente.' }
					#format.json { render :show, status: :created, location: @organization }
				else
					format.html { render :new }
					#format.json { render json: @organization.errors, status: :unprocessable_entity }
				end
		    end
    	end					
	end
end
