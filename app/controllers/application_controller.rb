class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_projects, :selected, :authenticate_user!
  
  def index

  end

protected
  
  
private 
  def get_projects
    @projects = Project.all
  end
  
  def selected
    @selected = "dashboard";
  end

  def render_form
    render :form
  end

  def is_new
    @new = true
  end
  
end
