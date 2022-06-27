class Public::OrdersController < ApplicationController
  before_action :authenticate_public!
  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order.total_price-800
  end

  def create
     @order = current_public.orders.new(order_params)
    @order.save
    p @order
    current_public.addresses.create!(
        postal_code: params[:order][:postal_code],
        address: params[:order][:address],
        name: params[:order][:name]
        )
    #４　注文履歴に移動
    @cart_items = current_public.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.quantity = cart_item.quantity
      @order_detail.price = cart_item.item.price
      @order_detail.save
    end
    #５ 最後にカート商品を全て削除する
    @cart_items.destroy_all
    #６　購入完了画面へ遷移
    redirect_to thanks_orders_path
  end

  def index

    @orders = current_public.orders.all

  end

  def confirm
    @cart_items = current_public.cart_items
    @order = current_public.orders.new(order_params)
    @total = @cart_items.inject(0){|sum,item| sum+item.subtotal}
    @order.total_price = @total+800

    if params[:order][:user_address] == "0"
      @order.postal_code = current_public.postal_code
      @order.delivery_address = current_public.address
      @order.delivery_name = current_public.family_name+current_public.first_name
    elsif params[:order][:user_address] == "1"
      @address = current_public.addresses.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    elsif params[:user_address] == "2"
      @order.postal_code =  params[:order][:postal_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name =  params[:order][:delivery_name]

    end
  end


  def thanks
  end
  private
  def order_params
    params.require(:order).permit(:postal_code,:delivery_address,:delivery_name,:method_of_payment,:status,:total_price,:delivery_charge,:user_address)
  end
end

