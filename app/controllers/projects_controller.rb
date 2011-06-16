class ProjectsController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_project, :only => [:show, :edit, :update, :destroy, :add_member, :remove_member]
  before_filter :is_new, :only => [:new, :create]

  def index
    @projects = Project.all
  end
  
  def show

  end 
  
  def new
    @project = Project.new

    render_form
  end
  
  def edit
    render_form
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      render_index
    else
      render_form
    end
  end
  
  def update
  	params[:project][:user_ids] ||= []
  		
    if @project.update_attributes(params[:project])
      render_index
    else
      render_form
    end
  end
  
  def destroy
    @project.destroy

    render_index
  end
  
  
  def overview
    @project = Project.find params[:project_id]
  end
  
  def add_member
  	@users = User.all
  end
  
  def remove_member
  	@users = User.all
  end
  
  def search
    @project = Project.find params[:project_id]
  end
    
private
  
  def get_project
    @project = Project.find params[:id]
  end
  
  def selected
    @selected = "project";
  end

  def render_index
    get_projects
    
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js { render :index }
    end
  end
  
end
