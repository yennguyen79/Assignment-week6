class Post < ApplicationRecord
  validates :body,  presence: true
  has_many :likes, as: :item
  belongs_to :poster, class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :mentions, dependent: :destroy

  def self.generate_posts(n= 5, user = nill)
    user ||= User.last
    n.times do 
      post = Post.create(body: Faker::HowIMetYourMother.quote,
        wall_user_id: user.id,
        poster: User.random_user
      )
      rand(3).times do
        post.comments.create(
          body: Faker::HowIMetYourMother.catch_phrase,
          user: User.random_user
        )
      end
    end
  end

  def post_on_wall
    Post.where(wall_user: @user).or(Post.where(post: @user))
  end

end
