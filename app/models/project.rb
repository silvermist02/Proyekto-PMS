class Project < ActiveRecord::Base
  has_many :tickets
  has_and_belongs_to_many :users

  validates_presence_of :name, :description, :status

  
end
