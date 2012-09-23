class PublicListController < ApplicationController
  layout 'logged'
  
  before_filter :authenticate_user!
  
  def index
    @lists = List.publics_for( current_user )
    respond_with(@lists)
  end
  
end
