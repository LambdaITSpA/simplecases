class Client < ActiveRecord::Base
  attr_accessor :organization_id
  belongs_to :client_type
  has_many :causes
  has_many :organization_clients
  def org_client
    self.org_client_by_id self.organization_id
  end
  def org_client_by_id(org_id)
    OrganizationClient.find_by(client_id: self.id, organization_id: org_id)
  end
  def name(organization_id)
  	self.data.name organization_id
  end
  def data(organization_id)
    self.organization_id = organization_id
    if self.client_type.name == 'Persona'
      self.org_client.person
    elsif self.client_type.name == 'Empresa'
      self.org_client.company  
    end
  end
  def type
    self.client_type
  end
end
