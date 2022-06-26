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
    def update
     @cart_item = CartItem.find(params[:id])
     @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
     flash[:notice] = "You have updated user successfully."
    redirect_to cart_items_path
    end
  def destroy
     @cart_item = CartItem.find(params[:id])
     @cart_item.destroy
    redirect_to cart_items_path
  end
  def destroy_all
     @cart_items = current_public.cart_items
     @cart_items.destroy_all
     redirect_to cart_items_path
  end

  private
  def cart_item_params
  params.require(:cart_item).permit(:item_id, :quantity)
  end

end
