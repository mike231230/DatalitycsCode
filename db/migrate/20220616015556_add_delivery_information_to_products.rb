class AddDeliveryInformationToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :delivery_information
  end
end
