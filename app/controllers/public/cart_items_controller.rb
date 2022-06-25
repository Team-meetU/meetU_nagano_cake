class Public::CartItemsController < ApplicationController
  before_action :authenticate_public!
  def index
    @cart_items = current_public.cart_items
  end

  def create
    @cart_item = current_public.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
