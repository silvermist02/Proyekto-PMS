class UsersController < ApplicationController
  before_filter :get_projects, :selected
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
   	@user.first_name = "Hi"
	  @user.middle_name = @user.user_name
	  @user.last_name = @user.user_name
	  @user.password = @user.user_name
	  @user.password_confirmation = @user.user_name
    
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
      sign_in(@user, :bypass => true) if @user.email.eql? current_user.email
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
    
  def unlock
    @user.middle_name = nil
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
  
 def selected
    @selected = "user";
  end
  
end

