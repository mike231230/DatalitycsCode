class AddProductContainerToDeliveryInformation < ActiveRecord::Migration[6.1]
  def change
    add_reference :delivery_informations, :product_containers
  end
end
