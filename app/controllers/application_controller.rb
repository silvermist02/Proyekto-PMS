class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_projects, :selected
  
  def index

  end
  
private
  
  def get_projects
    @projects = Project.all
  end
  
  def selected
    @selected = "dashboard";
  end
  
end
