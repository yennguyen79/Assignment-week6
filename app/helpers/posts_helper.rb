module PostsHelper
  def display_likers(post)
    post.likes.map{|e| e.user.email }.to_sentence 

  end
end
