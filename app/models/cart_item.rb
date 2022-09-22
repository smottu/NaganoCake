class CartItem < ApplicationRecord
  has_many :items
  belongs_to :customer
  belongs_to :item
  
  def subtotal
    item.with_tax_price * amount
  end

end
