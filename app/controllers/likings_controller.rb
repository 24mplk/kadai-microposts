class LikingsController < ApplicationController
  def show
   
      @likings = current_user.feed_likings.order('created_at DESC').page(params[:page])
    
  end
  
  def likings
   @likings = current_user.likings.page(params[:page])
  end  
  
end
