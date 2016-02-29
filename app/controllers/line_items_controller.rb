class LineItemsController < ApplicationController
  before_action :require_user, only: [:index, :show]  

  def create
    @user = current_user
    unless @user.current_cart
      new_cart = @user.carts.create
      @user.current_cart = new_cart
      @user.save
    end
    existing_line_item = already_in_cart?
    if existing_line_item
      existing_line_item.quantity += 1
      existing_line_item.save
    else
      @user.current_cart.line_items.create(item_id: params[:item_id])
    end
    redirect_to cart_path(@user.current_cart)
  end

  private

  def already_in_cart?
    @user.current_cart.line_items.where(item_id: params[:item_id])[0]
  end
end
