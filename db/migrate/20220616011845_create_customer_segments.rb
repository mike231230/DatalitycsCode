class CreateCustomerSegments < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_segments do |t|
      t.string :segment
    end
  end
end
