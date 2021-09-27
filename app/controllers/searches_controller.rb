class SearchesController < ApplicationController

 def search
  @range = params[:range]
  search = params[:search]
  word = params[:word]
  @word = params[:word]

   if @range == "1"
    @user = User.search(search, word).reverse_order.page(params[:page]).per(10)

   else
   	@post = Post.search(search, word).reverse_order.page(params[:page]).per(10)

   end
 end

end
