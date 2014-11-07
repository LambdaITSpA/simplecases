class ClientsController < ApplicationController

	def new
		@company = Company.new
	end

	def create
		raise "error"
	end
end
