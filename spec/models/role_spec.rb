require 'spec_helper'

describe Role do
	before(:each) do
  	@role = Role.new
  end
  
  it "should not have empty name" do
    @role.name = 1
    @role.should have(0).error_on(:name)
  end
  it "should not have empty member_add" do
    @role.member_add = 1
    @role.should have(0).error_on(:member_add)
  end
  it "should not have empty member_remove" do
    @role.member_remove = 1
    @role.should have(0).error_on(:member_remove)
  end
  it "should not have empty project_create" do
    @role.project_create = 1
    @role.should have(0).error_on(:project_create)
  end
  it "should not have empty project_read" do
    @role.project_read = 1
    @role.should have(0).error_on(:project_read)
  end
  it "should not have empty project_update" do
    @role.project_update = 1
    @role.should have(0).error_on(:project_update)
  end
  it "should not have empty project_delete" do
    @role.project_delete = 1
    @role.should have(0).error_on(:project_delete)
  end
  it "should not have empty ticket_create" do
    @role.ticket_create = 1
    @role.should have(0).error_on(:ticket_create)
  end
  it "should not have empty ticket_read" do
    @role.ticket_read = 1
    @role.should have(0).error_on(:ticket_read)
  end
  it "should not have empty ticket_update" do
    @role.ticket_update = 1
    @role.should have(0).error_on(:ticket_update)
  end
  it "should not have empty ticket_delete" do
    @role.ticket_delete = 1
    @role.should have(0).error_on(:ticket_delete)
  end
  it "should not have empty ticket_assign" do
    @role.ticket_assign = 1
    @role.should have(0).error_on(:ticket_assign)
  end
  it "should not have empty ticket_comment" do
    @role.ticket_comment = 1
    @role.should have(0).error_on(:ticket_comment)
  end
  it "should not have empty tag_create" do
    @role.tag_create = 1
    @role.should have(0).error_on(:tag_create)
  end
  it "should not have empty tag_read" do
    @role.tag_read = 1
    @role.should have(0).error_on(:tag_read)
  end
  it "should not have empty tag_update" do
    @role.tag_update = 1
    @role.should have(0).error_on(:tag_update)
  end
  it "should not have empty tag_delete" do
    @role.tag_delete = 1
    @role.should have(0).error_on(:tag_delete)
  end
end
