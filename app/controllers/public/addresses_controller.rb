class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.public_id = current_public_id
    address.save
    redirect_to '/addresses'
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  
  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
