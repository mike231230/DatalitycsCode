class Customer < ApplicationRecord
  has_many :geographic_zone
  has_many :customer_segment


end
