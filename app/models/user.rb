class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :middle_name, :last_name, :user_name, :birthdate, :role_id, :admin, :locked_at

  has_one :role
	#has_many :tickets, :dependent => :destroy
  #has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :projects
  
  validates_presence_of :first_name, :middle_name, :last_name, :user_name, :email
  
  after_create :pre_populate
  
  def full_name
    "#{self.last_name.capitalize}, #{self.first_name.capitalize} " ##{self.middle_name[0].capitalize}.
  end
  
  def self.search(name)
		find(:all, :conditions => ['first_name LIKE ? or middle_name LIKE ? or last_name LIKE ?', "%#{name}%", "%#{name}%", "%#{name}%"])
	end

	def unlock
    self.locked_at = ""
	end
	
	def pre_populate
	  self.first_name = "Hi"
	  self.middle_name = self.user_name
	  self.last_name = self.user_name
	  self.password = self.user_name
	  self.password_confirmation = self.user_name
	end
	
end
