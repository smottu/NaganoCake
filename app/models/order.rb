class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :payment_method, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { unpaid: 0, payment: 1, under_manufacture: 2, sipping_preparation: 3, shipped: 4 }

  def subtotal
    item.with_tax_price * amount
  end
end
