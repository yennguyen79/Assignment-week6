class Post < ApplicationRecord
  validates :body,  presence: true
  has_many :likes, as: :item
  belongs_to :poster, class_name: "User"
end
