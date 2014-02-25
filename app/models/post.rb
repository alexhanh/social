class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  # Gets user's friends' posts
  def self.feed_posts(user)
    find_by_sql("SELECT * FROM posts INNER JOIN friendships ON friendships.user_id = '#{user.id}' AND posts.author_id = friendships.friend_id ORDER BY created_at DESC")
  end
end
