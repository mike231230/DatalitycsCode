class AddReferencesToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :order_priorities
    add_reference :orders, :customers
    add_reference :orders, :shipments
    add_reference :orders, :products
  end
end
