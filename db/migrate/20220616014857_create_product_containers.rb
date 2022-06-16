class CreateProductContainers < ActiveRecord::Migration[6.1]
  def change
    create_table :product_containers do |t|
      t.string :container

    end
  end
end
