class Role < ActiveRecord::Base
  belongs_to :users
  
  validates_presence_of :name
end
