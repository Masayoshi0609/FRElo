class SearchesController < ApplicationController

 def search
  @range = params[:range]
  search = params[:search]
  word = params[:word]
  @word = params[:word]

   if @range == "1"
    @user = User.search(search, word).reverse_order.page(params[:page]).per(10)

   elsif @range =="2"
   	@post = Post.search(search, word).reverse_order.page(params[:page]).per(10)

   else
    redirect_back(fallback_location: root_path)
   end
 end

end
