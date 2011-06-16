class Ticket < ActiveRecord::Base
	belongs_to :user,  :foreign_key => :created_by
  belongs_to :project
	has_many :comments, :dependent => :destroy
	has_and_belongs_to_many :tags

  validates_presence_of :name, :description, :status, :priority, :tracker, :created_by
  
	def self.search(date, status, priority)
		find(:all, :conditions => ['created_at LIKE ? and status LIKE ? and priority LIKE ?', "%#{date}%", "%#{status}%", "%#{priority}%"])
	end
end
