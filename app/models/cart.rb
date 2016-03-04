class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  
  def total
    line_items.collect {|i| i.item.price * i.quantity}.inject(:+)
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id)
    end
      line_item
  end

  def checkout
    self.status = "submitted"
  end

end
