class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :unit_price
      t.float :shopping_cost
      t.float :profit
      t.float :product_base_margin
      t.timestamps
    end
  end
end
