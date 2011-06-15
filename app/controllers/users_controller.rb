class UsersController < ApplicationController
  before_filter :get_projects
  before_filter :get_roles, :only => [:new, :edit]
  before_filter :get_user, :only => [:edit, :update, :unlock]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end
  
  def edit

  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render :edit
    end
  end

    
  def unlock
    @user.unlock
    @user.update_attributes(params[:user])

    redirect_to users_path
  end
 
private
  
  def get_projects
    @projects = Project.all
  end
  
  def get_roles
    @roles = Role.all
  end

  def get_user
    @user = User.find(params[:id])
  end
  
end

