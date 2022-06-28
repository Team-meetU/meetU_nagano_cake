class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @publics = Public.all
  end

  def show
    @public = Public.find(params[:id])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    if @public.update(public_params)
      redirect_to admin_customer_path(@public.id)
      flash[:notice] = '会員情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def public_params
    params.require(:public).permit(
      :family_name, :first_name, :family_name_kana,
      :first_name_kana, :postal_code, :address,
      :phone_number, :email, :is_deleted)
  end
end
