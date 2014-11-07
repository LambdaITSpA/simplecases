class ClientsController < ApplicationController

	def new
		@company = Company.new
	end
end
