class Subject < ActiveRecord::Base
	has_many :permissions
	def class_name_rep
		self.class_name[0] == ':' ? self.class_name.tr(':','').to_sym : self.class_name.constantize
	end
end
