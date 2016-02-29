class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user
  
  def total
    line_items.collect {|i| i.item.price * i.quantity}.inject(:+)
  end

  def add_item(item_id)
    item = Item.find(item_id)
    line_item = line_items.detect {|li| li.item == item}
    line_item ||= LineItem.new
    line_item.cart = self
    line_item.item = item
    line_item
  end

end
