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

  def notifications?
    notifications > 0
  end

  def notifications
    todays_payments.count + late_payments.count
  end

  def clients
    clients = Hash.new
    self.causes.each do |c|
      clients[c.client.id] ||= c.client
    end
    clients
  end

  def journal_entries
    JournalEntry.joins(:user_cause).where(user_causes: {user_id: self.id}).order(created_at: :desc)
  end

  def todays_payments
    Payment.joins(cause: :user_causes).where(user_causes:{user_id: self.id}, payments:{date: Date.today, payed: false})
    #self.causes.map(&:payments)[0].where(date: Date.today, payed: false)
  end

  def open_causes
    self.causes.reject{|c| c.state.id==6}
  end

  def late_payments
    #Payment.joins(cause: :user_causes).where('user_causes.user_id = ? AND payments.date < ? AND payments.payed = ?', self.id, Date.today, false)
    self.open_causes.count > 0 ? self.open_causes.map(&:payments)[0].where('date < ? AND payed = ?', Date.today, false) : []
  end
end
