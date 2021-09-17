class CommentsController < ApplicationController

  def create
	 @post_detail = Post.find(params[:post_id])
	 @comments = @post_detail.comments
	 @comment = Comment.new(comment_params)
	 #@comment = current_user.comments.build(comment_params)
	 @comment.post_id = @post_detail.id
	 @comment.user_id = current_user.id
	 @comment.save
  end

  def destroy
  	@post_detail = Post.find(params[:post_id])
  	@comments = @post_detail.comments
  	Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end


private

	def comment_params
		params.require(:comment).permit(:body, :post_id, :user_id)
	end
end


