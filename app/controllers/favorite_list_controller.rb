class FavoriteListController < ApplicationController
  layout 'logged'
  
  before_filter :authenticate_user!
  
  def index
    @lists = current_user.favorite_lists
    respond_with(@lists)
  end
  
  def create
    @list = List.find(params[:list_id])
    current_user.favorite_lists << @list
    current_user.save
    respond_with(@list)
  end
  
  def update
    @list = List.find(params[:list_id])
    current_user.favorite_lists.destroy(@list)
    respond_with(@list)
  end
end
