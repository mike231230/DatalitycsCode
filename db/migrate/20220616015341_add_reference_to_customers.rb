class AddReferenceToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_reference :customers, :geographic_zones
  end
end
