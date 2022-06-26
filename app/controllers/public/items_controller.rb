class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def confirm
    @items = current_public.cart_items
  end
  
end
