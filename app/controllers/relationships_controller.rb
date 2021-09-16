class RelationshipsController < ApplicationController


#フォロー作成、保存、削除

 def create
 	current_user.follow(params[:user_id])
 	redirect_to request.referer
 end

 def destroy
 	current_user.unfollow(params[:user_id])
 	redirect_to request.referer
 end


#フォロー・フォロワーの一覧表示

 def followings
  user = User.find(params[:user_id])
  @users = user.followings
 end

 def followers
  user = User.find(params[:user_id])
  @users = user.followers
 end


end
