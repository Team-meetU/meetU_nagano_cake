class Public::CartItemsController < ApplicationController
  before_action :authenticate_public!
  def index
    @cart_items = current_public.cart_items
  end
end
