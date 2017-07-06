class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      flash[:success] = "Your comment has been created!"
      redirect_to :back
    else
      puts @comment
      flash[:alert] = "Your new comment couldn't be created!  Please check the form."
      redirect_to root_path
    end
    
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    
    if @comment.destroy
      flash[:success] = "Your comment has been deleted!"
      redirect_to root_path
    else
      flash[:alert] = "Your comment couldn't be deleted."
    end
  
    
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
