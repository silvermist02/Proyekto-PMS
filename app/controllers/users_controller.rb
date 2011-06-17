class UsersController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_roles, :only => [:new, :edit, :create, :update]
  before_filter :get_user, :only => [:edit, :update, :unlock]
  before_filter :is_new, :only => [:new, :create]
  load_and_authorize_resource

  
  def index
    get_users
  end
  
  def new
    @user = User.new

    render_form
  end

  def show

  end
  
  def create
    @user = User.new params[:user]
    populate_fields
    
    if @user.save
      render_index
    else
      render_form
    end
  end
  
  def edit
    if not @user.eql? current_user and !current_user.admin
      redirect_to root_path
    else
      render_form
    end
  end
  
  def update
    @email = current_user.email
    if @user.update_attributes(params[:user])
      sign_in(@user, :bypass => true) if @user.email.eql? @email

      render_index
    else
      render_form
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render_index
  end
    
  def unlock
		unlock_user
		
    @user.update_attributes(params[:user])
		
		get_locked_users
    render :locked
  end

  def locked
    get_locked_users
  end
 
private
  
  def get_roles
    @roles = Role.all
  end

  def get_user
    @user = User.find(params[:id])
  end
  
  def selected
    @selected = "user";
  end

  def get_users
    @users = User.all
  end

  def render_index
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js do
        get_users
        render :index
      end
    end
  end

  def populate_fields
    @user.first_name = "proyekto"
	  @user.middle_name = "proyekto"
	  @user.last_name = "proyekto"
	  @user.password = "proyekto"
	  @user.password_confirmation = "proyekto"
  end
  
  def unlock_user
  	@user.locked_at = nil
    @user.failed_attempts = 0
    @user.status = "Active"
  end
  
  def get_locked_users
  	@users = User.locked
  end
end

