class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :quantity
      t.float :sale
      t.float :discount
      t.timestamps
    end
  end
end
