json.extract! @post, :id, :wall_user_id, :body, :created_at, :updated_at
json.poster @post.poster, :id, :name, :email, :gender, :avatar
