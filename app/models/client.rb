class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :causes
  has_one :company
  has_one :person
  def name
  	if self.client_type.name == 'Persona'
  		self.person.name
  	elsif self.client_type.name == 'Empresa'
  		self.company.name
  	end
  end
  def type
    self.client_type
  end
end
