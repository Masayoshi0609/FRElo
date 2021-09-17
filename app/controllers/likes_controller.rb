class LikesController < ApplicationController

  def create
    @like_post = Post.find(params[:post_id])
  # 	like = current_user.likes.build(post_id: params[:post_id])
  	like = current_user.likes.new(post_id: @like_post.id)
  	like.save
  end

	def destroy
	  @like_post = Post.find(params[:post_id])
  	like = current_user.likes.find_by(post_id: @like_post.id)
  	like.destroy
	end

end



