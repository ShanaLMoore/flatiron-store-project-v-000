class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])

  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
