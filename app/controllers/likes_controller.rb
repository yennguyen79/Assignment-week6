class LikesController < ApplicationController
  before_action :authenticate_user!
  def toggle
    if params[:post_id]
      item = Post.find (params[:post_id])
    elsif params[:comment_id]
      item = Comment.find params[:comment_id]
    end

    current_user.toggle_like!(item)      
    redirect_to root_path
  end
end
