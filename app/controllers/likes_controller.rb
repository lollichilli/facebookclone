class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    flash[:alert] = 'You already liked this post' unless @like.save
    redirect_to root_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
