class CartsController < ApplicationController
  before_action :require_user, only: [:index, :show]
  
  def index
    @carts = current_user.carts
  end

  def show
    @cart = Cart.find(params[:id])
  end

  private

  def set_cart
    @cart = current_user.current_cart
    redirect_to store_path if @cart.nil?
  end
end
