class PostsController < ApplicationController
  
  def index
    @posts = Post.order("updated_at DESC").page(1).per(10)
    
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
  
    def paging
      params[:per] ||= 10
      @posts = Post.order("updated_at DESC").page(params[:page]).per(params[:per])
      
      render partial: 'post', collection: @posts, layout: false
    end
  
    def show
    @post = Post.find params[:id]
    respond_to do |format|
      format.html
      format.json
      end
    end
   
  private 

  def post_params
    params.require(:post).permit(:body, :wall_user_id)
  end
 
 end