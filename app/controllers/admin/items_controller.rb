class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
  end

  def index
  	@items = Item.all
  end

  def create
    @item = Item.new(item_params)
  	if @item.save
  	   redirect_to admin_item_path(@item)
  	   flash[:notice] = '新しい商品を登録しました。'
  	else
  	   render "new"
  	end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  	if @item.update(item_params)
  	  redirect_to admin_item_path(@item.id)
  	else
  		render "edit"
  		flash[:notice] = '商品情報を編集しました。'
  	end
  end
end
  private

  def item_params
  	params.require(:item).permit(:genre_id,:name,:explanation,:price,:is_stock,:image)
  end

