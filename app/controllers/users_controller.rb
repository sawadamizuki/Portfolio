class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
     @posts = @user.posts.page(params[:page]).reverse_order
     likes = Like.where(user_id: current_user.id).pluck(:post_id)
     @like_list = Post.find(likes)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
