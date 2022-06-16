class Order < ApplicationRecord

  has_many :order_priorities
  has_many :customers
  has_many :shipments
  has_many :products

end
