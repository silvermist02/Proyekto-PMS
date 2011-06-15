class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  
  validates_presence_of :body, :user_id, :ticket_id
end
