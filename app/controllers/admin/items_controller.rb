class Admin::ItemsController < ApplicationController
  def new
    @item = Item,new
  end

  def create
    @item = Item.new(item_params)
    @item = user_id=current_user.id
  end

  def show
    @items=Item.find(params[:id])
  end

  def edit
    @items=Item.find(params[:id])
  end

  def update
    @items=Item.find(params[:id])
  end
  private
end
end
