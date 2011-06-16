class TicketsController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_project, :only => [:index, :search, :new, :create, :assign]
  before_filter :get_index, :only => [:index, :search]

  #around_filter :get_index, :only => [:create]

  def index

  end
  
  def show
    @ticket = Ticket.find(params[:id])
    @comments = @ticket.comments
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def edit
    @ticket = Ticket.find(params[:id])
  end
  
  def create
    @ticket = @project.tickets.build(params[:ticket])
    @ticket.created_by = current_user.id

    @ticket.save
    
    get_index
  end
  
  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update_attributes(params[:ticket])
      redirect_to projects_path
    else
      render :edit
    end
  end
  
  def destroy
    @ticket = Ticket.find(params[:id])
    @project = @ticket.project
    @ticket.destroy
    
    @tickets = @project.tickets.search(params[:date], params[:status], params[:priority])
    @users = User.search(params[:name])
  end
  
  def assign
  	@users = @project.users
  	@ticket = Ticket.find(params[:id])
  end
  
  def log_time
		@ticket = Ticket.find(params[:id])
  end
  
  def search
  
  end
  
private
  
  def get_project
    @project = Project.find params[:project_id]
  end
  
  def get_index
    @tickets = @project.tickets.search(params[:date], params[:status], params[:priority])
    @users = User.search(params[:name])
  end
  
  def selected
    @selected = "project";
  end
end
