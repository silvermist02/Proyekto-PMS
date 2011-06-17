class ProjectsController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_project, :only => [:show, :edit, :update, :destroy, :add_member, :remove_member, :members, :members_update]
  before_filter :is_new, :only => [:new, :create]
  before_filter :get_members, :only => [:members, :add_members, :remove_members, :members_update]
  load_and_authorize_resource

  def index
    if current_user.admin
      @projects = Project.all
    else
      get_projects
    end
    #User.tag_counts.order('count DESC').limit(5).where('tags.name LIKE ?', params[:query]) 
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
  	@add = true
  	get_members
  	
  	render_member_form
  end
  
  def remove_member
    get_members
  
  	render_member_form
  end
  
  def search
    @project = Project.find params[:project_id]
  end
  
  def members
    get_members
  end
  
  def members_update
    if params[:project].nil?
      @project.users.clear
    else
  	  params[:project][:user_ids] ||= []
  	end
  	
    @project.update_attributes(params[:project])

    render :members
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
  
  def render_member_form
    @users = User.all
  	render 'member_actions'
  end
  
  def get_members
    @members = @project.users
  end
  
end
