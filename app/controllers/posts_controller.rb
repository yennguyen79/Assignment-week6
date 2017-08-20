class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order("updated_at DESC")
  end
 
  def new
  end
 
  def create
    @post = Post.new post_params
    @post.poster = current_user
    @post.wall_user_id ||= current_user
    
    if @post.save
      PostMailer.notify_new_post(@post).deliver
    else  
      flash[:error] = "Error: #{post.errors.full_messages.to_sentence}"
    end

    redirect_to posts_path  
  end
 
  private 

  def post_params
    params.require(:post).permit(:body, :wall_user_id)
  end
 
 end