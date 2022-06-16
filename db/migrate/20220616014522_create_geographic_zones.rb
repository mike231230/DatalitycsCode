class CreateGeographicZones < ActiveRecord::Migration[6.1]
  def change
    create_table :geographic_zones do |t|
      t.string :province
      t.string :region
    end
  end
end
