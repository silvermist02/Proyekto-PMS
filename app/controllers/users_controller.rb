class UsersController < ApplicationController
  before_filter :get_projects, :selected
  before_filter :get_roles, :only => [:new, :edit, :create, :update]
  before_filter :get_user, :only => [:edit, :update, :unlock]
  before_filter :is_new, :only => [:new, :create]
  
  def index
    get_users
  end
  
  def new
    @user = User.new

    render_form
  end
  
  def create
    @user = User.new params[:user]
    @user.first_name = "Hi"
	  @user.middle_name = @user.user_name
	  @user.last_name = @user.user_name
	  @user.password = @user.user_name
	  @user.password_confirmation = @user.user_name
    
    if @user.save
      render_index
    else
      render_form
    end
  end
  
  def edit
    render_form
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
    @user.locked_at = nil
    @user.update_attributes(params[:user])

    redirect_to users_path
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
      format.html { redirect_to users_path }
      format.js do
        get_users
        render :index
      end
    end
  end
  
end

