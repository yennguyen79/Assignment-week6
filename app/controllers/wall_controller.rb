class WallController < ApplicationController
  def show
    @user = User.find params[:id]
    @posts = @user.posts_on_wall
  end

end
