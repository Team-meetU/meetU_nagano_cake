class Admin::CustomersController < ApplicationController
  def index
    @publics = Public.all
  end

  def show
    @public = Public.find(params[:id])
    #@publics = Public.all
  end

  def edit
  end

  def update
  end
end
