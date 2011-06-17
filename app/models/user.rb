class User < ActiveRecord::Base

  attr_accessor :login
  # attr_writer :locked_at
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :middle_name, :last_name, :user_name, :birthdate, :role_id, :admin, :login, :locked_at
  has_one :role
	has_many :tickets
  has_many :comments
  has_and_belongs_to_many :projects
  
  validates_presence_of :first_name, :middle_name, :last_name, :user_name, :email

  before_create :set_status_active
  #after_create :pre_populate

  scope :locked, :conditions => ['status = ? or failed_attempts > ?', 'Locked', 3]

  def set_status_active
    self.status = "Active"
  end
  
  def full_name
    "#{self.last_name.capitalize}, #{self.first_name.capitalize} " ##{self.middle_name[0].capitalize}.
  end

	def unlock
    self.locked_at = ""
	end
	
	def pre_populate
	  self.first_name = "proyekto"
	  self.middle_name = "proyekto"
	  self.last_name = "proyekto"
	  self.password = "proyekto"
	  self.password_confirmation = "proyekto"
	end

	def role_name
	  if self.admin
	    @role_name = "Administrator"
	  else
      role = Role.find(self.role_id)
      @role_name = role.name
    end

    return @role_name
  end

protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  end 
end
