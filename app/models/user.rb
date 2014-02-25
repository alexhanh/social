class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Posts that have been made by this user
  has_many :authored_posts, -> { order(:created_at).includes(:author) }, class_name: "Post", foreign_key: "author_id"
  
  # Posts that have been posted by user's friends on the user's wall
  has_many :received_posts, -> { order(:created_at).includes(:author) }, class_name: "Post", foreign_key: "recipient_id"

  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  def is_friend_with?(user)
    friendships.where(:friend_id => user.id).exists?
  end
end