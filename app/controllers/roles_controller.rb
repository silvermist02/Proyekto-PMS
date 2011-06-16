class RolesController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :is_new, :only => [:new, :create]
  
  def index
    get_roles
  end
  
  def new
    @role = Role.new

    render_form
  end
  
  def edit
    @role = Role.find(params[:id])

    render_form
  end
  
  def create
    @role = Role.new(params[:role])
    
    if @role.save
      render_index
    else
      render_form
    end
  end
  
  def update
    @role = Role.find(params[:id])

    if @role.update_attributes(params[:role])
      render_index
    else
      render_form
    end
  end
  
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    render_index
  end
  
private
  
  def selected
    @selected = "role";
  end

  def get_roles
    @roles = Role.all
  end

  def render_index
    get_roles
  
    respond_to do |format|
      format.html { redirect_to roles_path }
      format.js { render :index }
    end
  end
  
end
