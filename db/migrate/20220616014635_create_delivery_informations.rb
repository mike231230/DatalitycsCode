class CreateDeliveryInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_informations do |t|
      t.string :product_category
      t.string :product_sub_category

    end
  end
end
