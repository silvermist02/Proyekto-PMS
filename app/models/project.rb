class Project < ActiveRecord::Base
  has_many :tickets
  has_and_belongs_to_many :users

  validates_presence_of :name, :description, :status

  def total_log_time
    total = 0
    if not self.tickets.empty?
      self.tickets.each do |t|
        total += t.logged_time.split('hour/s')[0].to_i
      end
    end
    
    return total.to_s + " hr/s"
  end
end
