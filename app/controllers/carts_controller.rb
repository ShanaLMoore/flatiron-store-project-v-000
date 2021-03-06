class CartsController < ApplicationController
  before_action :require_user
  
  def index
    @carts = current_user.carts
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    current_user.current_cart=nil
    @cart.save
    @current_user.save
    redirect_to cart_path(@cart)
  end

  private

  def set_cart
    @cart = current_user.current_cart
    redirect_to store_path if @cart.nil?
  end

end
