class DeliveryInformation < ApplicationRecord

  belongs_to :product

  has_many :delivery_information

  def find_category(opt1,opt2,opt3)
    DeliveryInformation.find_by(product_category: opt1, product_sub_category: opt2, product_container_id: ProductContainer.find_by(container: opt3).id)
  end

end
