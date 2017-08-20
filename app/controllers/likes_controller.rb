class LikesController < ApplicationController
  before_action :authenticate_user!
  def toggle
    if params[:post_id]
      @item = Post.find (params[:post_id])
      current_user.toggle_like!(@item)    
      
    # elsif params[:comment_id]
    #   @item = Comment.find params[:comment_id]
    end

      respond_to do |format|
        format.html {redirect_to posts_path}
        format.js
    end
  end
end
