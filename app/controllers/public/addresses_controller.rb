class Public::AddressesController < ApplicationController
  before_action :authenticate_public!
  def index
    @addresses = current_public.addresses
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.public_id = current_public.id
    address.save
    redirect_to addresses_path
  end

  def edit
    @address = current_public.addresses.find(params[:id])
  end
  def update
    @address = current_public.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  def destroy
   address = current_public.addresses.find(params[:id])
   address.detroy!
   redirect_to addresses_path
  end


  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
