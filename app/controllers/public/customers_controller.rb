class Public::CustomersController < ApplicationController
  def show
    @customer = current_public
  end

  def edit
   @customer = current_public
  end

  def update
    @public = Public.find(params[:id])
    if @public.update(public_params)
      redirect_to edit_customer_path(@public.id)
      flash[:notice] = '会員情報が更新されました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end
end