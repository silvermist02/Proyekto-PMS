class TicketsController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_project, :only => [:index, :search, :new, :create, :assign]
  before_filter :get_ticket, :only => [:show, :edit, :update, :assign, :log_time, :destroy]
  load_and_authorize_resource


  def index
    @tickets = @project.tickets.search_index
  end
  
  def show
    @comments = @ticket.comments

    get_users
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def edit

  end
  
  def create
    @ticket = @project.tickets.build(params[:ticket])
    @ticket.created_by = current_user.id

    @ticket.save
    
    get_index
  end
  
  def update
    if @ticket.update_attributes(params[:ticket])
      get_users
      respond_to do |format| 
        format.html { redirect_to tickets_path(@ticket) }
        format.js
      end
    else
      respond_to do |format| 
        format.html { render :edit }
        format.js
      end
    end
  end
  
  def destroy
    @project = @ticket.project
    @ticket.destroy
    
    get_index
  end
  
  def assign

  end
  
  def log_time

  end
  
  def search
    get_index
  end
  
private
  
  def get_project
    @project = Project.find params[:project_id]
  end
  
  def get_index
    @tickets = @project.tickets.search(params[:name], params[:date], params[:status], params[:priority])
  end
  
  def selected
    @selected = "project";
  end

  def get_users
    @assigned = User.find(@ticket.assigned_to).nil? ? "None." : User.find(@ticket.assigned_to).full_name
    @creator = User.find(@ticket.created_by).full_name
  end

  def get_ticket
    @ticket = Ticket.find(params[:id])
  end
end
