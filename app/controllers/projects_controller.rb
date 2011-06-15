class ProjectsController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_project, :only => [:show, :edit, :update, :destroy, :add_member, :remove_member]

  def index
    @projects = Project.all
  end
  
  def show

  end 
  
  def new
    @project = Project.new
  end
  
  def edit

  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end
  
  def update
  	params[:project][:user_ids] ||= []z
  		
    if @project.update_attributes(params[:project])
      redirect_to projects_path
    else
      render :edit
    end
  end
  
  def destroy
    @project.destroy

    redirect_to projects_path
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
    
private
  
  def get_projects
    @projects = Project.all
  end
  
  def get_project
    @project = Project.find params[:id]
  end
  
  def selected
    @selected = "project";
  end
  
end
