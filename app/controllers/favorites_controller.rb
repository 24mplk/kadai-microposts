class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = 'favorited the post.'
    redirect_to micropost
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = 'un-favorited the post'
    redirect_to micropost
  end
end


  
  
  