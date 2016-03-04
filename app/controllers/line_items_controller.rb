class LineItemsController < ApplicationController
  before_action :require_user  
  before_action :initialize_cart, only: [:create]

  def create
    @current_cart = current_user.current_cart
    new_line = @current_cart.add_item(params[:item_id])
    new_line.save
    redirect_to cart_path(@current_cart)
  end
end
