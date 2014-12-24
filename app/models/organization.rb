class Organization < ActiveRecord::Base
	has_many :users
	has_many :organization_clients
	has_many :clients, through: :organization_clients
	def causes
		Cause.joins(users: :organization).where(organizations: {id: self.id})
	end
	def clients
		Client.joins(causes: {users: :organization}).where(organizations: {id: self.id})
	end

	def open_causes
		self.causes.reject{|c| c.state.id==6}
	end
end
