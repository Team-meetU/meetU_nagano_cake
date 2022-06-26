class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  
  def updated
    @order = Order.find(params[:id])
  	@order_items = @order.order_items
  	@order.update(order_params)
  end
end
