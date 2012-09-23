class ListsController < ApplicationController
  layout 'logged'
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource :list
  
  def index
    @lists = current_user.lists
    respond_with(@lists)
  end

  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params[:list])
    @list.user = current_user
    @list.save
    respond_with(@list)
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_with(@list)
  end
end
