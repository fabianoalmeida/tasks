class PublicListController < ApplicationController
  layout 'logged'
  
  before_filter :authenticate_user!
  
  def index
    @lists = List.where{ ( user_id.not_eq my{ current_user.id } ) & ( limited.eq false ) }
    respond_with(@lists)
  end
  
end
