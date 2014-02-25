class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.order(:full_name)
  end

  def befriend
    friend = User.find(params[:friend_id])
    current_user.friendships.build(friend_id: friend.id)
    friend.friendships.build(friend_id: current_user.id)

    current_user.save!
    friend.save!

    redirect_to :back
  end
end