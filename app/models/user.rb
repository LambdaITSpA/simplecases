class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable#, :registerable
  belongs_to :organization
  has_many :user_causes
  has_many :causes, through: :user_causes
  has_many :journal_entries

  def admin?
  	self.organization.id == 1
  end

  def clients
    clients = Hash.new
    self.causes.each do |c|
      clients[c.client.id] ||= c.client
    end
    clients
  end
end
