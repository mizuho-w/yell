class RelationshipsController < ApplicationController

before_action :set_user

  def create
    following = current_user.follow(@user)
      redirect_back(fallback_location: root_path)
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def following
    user = User.find(params[:follow_id])
    @users = user.followings
  end

  def follower
    user = User.find(params[:follow_id])
    @users = user.followers
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end
