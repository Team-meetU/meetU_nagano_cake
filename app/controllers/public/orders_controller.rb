class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def show
  end
  
  def create
  end
  
  def index
    @addresses = Address.all
  end
  
  def confirm
  end
  
  def thanks
  end
  
end
