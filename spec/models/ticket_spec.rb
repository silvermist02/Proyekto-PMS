require 'spec_helper'

describe Ticket do
	before(:each) do
  	@ticket = Ticket.new
  end
  
  it "should not have empty name" do
    @ticket.name = 'Name'
    @ticket.should have(0).error_on(:name)
  end
  it "should not have empty description" do
    @ticket.description = 'Description'
    @ticket.should have(0).error_on(:description)
  end
  it "should not have empty status" do
    @ticket.status = 'Open'
    @ticket.should have(0).error_on(:status)
  end
  it "should not have empty priority" do
    @ticket.priority = 'Minor'
    @ticket.should have(0).error_on(:priority)
  end
  it "should not have empty tracker" do
    @ticket.tracker = 'Bug'
    @ticket.should have(0).error_on(:tracker)
  end
  it "should not have empty created_by" do
    @ticket.created_by = 1
    @ticket.should have(0).error_on(:created_by)
  end
  it "should not have empty created_at" do
    @ticket.created_at = '2011-06-03 02:47:33'
    @ticket.should have(0).error_on(:created_at)
  end
end
