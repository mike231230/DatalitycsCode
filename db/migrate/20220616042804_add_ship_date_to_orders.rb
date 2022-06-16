class AddShipDateToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ship_date, :date
    add_column :orders, :profit, :float
    remove_column :products, :profit
  end
end
