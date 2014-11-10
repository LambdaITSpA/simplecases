class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :causes
  has_one :company
  has_one :person
end
