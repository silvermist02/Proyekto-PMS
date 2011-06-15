require 'spec_helper'

describe Comment do
	before(:each) do
  	@comment = Comment.new
  end
  
	it "should not have empty body" do
    @comment.body = 'Body'
    @comment.should have(0).error_on(:body)
  end
  it "should not have empty user_id" do
    @comment.user_id = 1
    @comment.should have(0).error_on(:user_id)
  end
  it "should not have empty ticket_id" do
    @comment.ticket_id = 1
    @comment.should have(0).error_on(:ticket_id)
  end
  it "should not have empty created_at" do
    @comment.created_at = '2011-06-03 02:47:33'
    @comment.should have(0).error_on(:created_at)
  end
end
