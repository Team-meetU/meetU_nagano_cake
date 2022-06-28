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
  @order = Order.new(order_params)
    cart_item = current_public.cart_items.all#ログインユーザーのカートアイテムをすべて取り出してcart_item に入れる
    @order.save
    current_public.cart_items.each do | cart_item |# 取り出したカートアイテムの数繰り返す
      order_detail = OrderDetail.new#order_detailにも一緒にデータを保存する必要があるのでここで保存
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.quantity = cart_item.quantity
      #order_detail.making_status = "no_running"
      order_detail.save#カート情報を削除するためitemとの紐付けが切れる前に保存
    end
    cart_item.destroy_all#ユーザーに関連するカートのデータをすべて削除
    redirect_to thanks_orders_path
end

def index
  @orders = Order.all
end

def confirm
  @cart_items = CartItem.all
  @order = current_public.orders.new
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
end

end

def thanks
end

private

def order_params
params.require(:order).permit(:postal_code,:delivery_address,:delivery_name,:method_of_payment,:status,:total_price,:delivery_charge)
end
end
