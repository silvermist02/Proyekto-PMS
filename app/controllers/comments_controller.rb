class CommentsController < ApplicationController
  
  before_filter :get_ticket

  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = @ticket.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comments = @ticket.comments
    
    
    @comment.save
  end
  
  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to comments_path
    else
      render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comments = @ticket.comments
  end
  
private

  def get_ticket
    @ticket = Ticket.find params[:ticket_id]
  end
  
end
