class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :author
      t.references :recipient
      t.string :content
      t.timestamps
    end

    create_table :friendships do |t|
      t.references :user
      t.references :friend
    end
  end
end
