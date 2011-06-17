class Ticket < ActiveRecord::Base
	belongs_to :user,  :foreign_key => :created_by
  belongs_to :project
	has_many :comments, :dependent => :destroy
	acts_as_taggable
  acts_as_taggable_on :tags

  before_create :set_logged_time
  validates_presence_of :name, :description, :status, :priority, :tracker, :created_by
  
  before_create :creator_assigned

  scope :search_index, :conditions => ['status != ?', 'Resolved']
  scope :resolved, :conditions => ['status = ?', 'Resolved']
  scope :open, :conditions => ['status = ?', 'Open']
    
  def creator_assigned
  	self.assigned_to = self.created_by
  end
  
	def self.search(name, date, status, priority)
		if name != "" or date != "" or status != "" or priority != ""
			find(:all, :conditions => ['assigned_to LIKE ? and created_at LIKE ? and status LIKE ? and priority LIKE ?', "%#{name}%", "%#{date}%", "%#{status}%", "%#{priority}%"])
		else
			find(:all)
		end
	end

	def set_logged_time
    self.logged_time = "0hour/s"
	end
end
