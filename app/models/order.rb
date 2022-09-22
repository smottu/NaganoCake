class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { unpaid: 0, payment: 1, under_manufacture: 2, sipping_preparation: 3, shipped: 4 }
end
