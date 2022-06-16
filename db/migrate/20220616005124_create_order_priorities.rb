class CreateOrderPriorities < ActiveRecord::Migration[6.1]
  def change
    create_table :order_priorities do |t|
      t.string :priority
    end
  end
end
