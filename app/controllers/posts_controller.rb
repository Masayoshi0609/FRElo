class PostsController < ApplicationController
  def create
  end

  def show
  end

  def destroy
  end


private

  def post_params
    params.require(:post).permit(:body, :image)
  end


end