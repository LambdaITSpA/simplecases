class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :causes
  belongs_to :company
  has_one :person
end
