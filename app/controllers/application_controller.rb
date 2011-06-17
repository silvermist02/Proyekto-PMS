class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_projects, :selected, :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to root_url
  end

  
  def index

  end

protected
  
  
private 
  def get_projects
    if user_signed_in?
      @projects = current_user.projects
    else
      @projects = []
    end

    return @projects
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
