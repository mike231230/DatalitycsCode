# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Order.destroy_all
Product.destroy_all
DeliveryInformation.destroy_all
Customer.destroy_all
CustomerSegment.destroy_all
OrderPriority.destroy_all
Shipment.destroy_all
ProductContainer.destroy_all
GeographicZone.destroy_all




csv_text = File.read(Rails.root.join('lib','seeds',"Superstore_sales.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

segments = []
priorities = []
shipments = []
containers = []
geographic_zones = []

csv.each do |row|
  line = row.to_hash
  segments.push( line["Customer Segment"])
  priorities.push(line["Order Priority"])
  shipments.push(line["Ship Mode"])
  containers.push(line["Product Container"])
  hash = { province: line["Province"], region: line["Region"] }
  geographic_zones.push(hash)

end

segments.uniq.each { |segment| CustomerSegment.create(segment: segment) }

priorities.uniq.each { |priority| OrderPriority.create(priority: priority) }

shipments.uniq.each { |shipment| Shipment.create(ship_mode: shipment) }

containers.uniq.each { |container| ProductContainer.create(container: container) }

geographic_zones.uniq { |e| [e[:province], e[:region]] }.each do |zones|
  GeographicZone.create(province: zones[:province], region: zones[:region])
end

delivery_informations = []

csv.each do |row|
  line = row.to_hash
  hash = { product_category: line["Product Category"], product_sub_category: line["Product Sub-Category"],
          product_container: line["Product Container"] }
  delivery_informations.push(hash)
end

delivery_informations.uniq {|e| [e[:product_category], e[:product_sub_category], e[:product_container]]}.each do |delivery|
  DeliveryInformation.create(product_category: delivery[:product_category], 
                             product_sub_category: delivery[:product_sub_category],
                             product_containers_id: ProductContainer.find_by(container: delivery[:product_container]).id)
end

products = []

csv.each do |row|
  line = row.to_hash
  hash = { product_name: line["Product Name"], unit_price: line["Unit Price"], shiping_cost: line["Shiping Cost"],
           product_base_margin: line["Product Base Margin"], product_category: line["Product Category"], product_sub_category: line["Product Sub-Category"],
           product_container: line["Product Container"]}
  products.push(hash)
end

products.uniq{|e| e[:product_name]}.each do |product|
  Product.create(name: product[:product_name], unit_price: product[:unit_price], shopping_cost: product[:shopping_cost],
                 product_base_margin: product[:product_base_margin],
                 delivery_information_id: DeliveryInformation.find_by( product_category: product[:product_category],
                                                                       product_sub_category: product[:product_sub_category],
                                                                       product_containers_id: ProductContainer.find_by(container:product[:product_container])) ).id

end

customers = []

csv.each do |row|
  line = row.to_hash
  hash = { name: line["Customer Name"], segment: line["Customer Segment"], zone: line["Province"]}
  customers.push(hash)
end

customers.uniq {|e| e[:name]}.each do |customer|
  Customer.create(name: customer[:name], customer_segments_id: CustomerSegment.find_by(segment: customer[:segment]),
                  geographic_zones_id: GeographicZone.find_by(province: customer[:province]))
end


csv.each do |row|
  line = row.to_hash

  Order.create(order_date: line["Order Date"], quantity: line["Order Quantity"],
               sale: line["Sales"], discount: line["Discount"], ship_date: line["Ship Date"],
               profit: line["Profit"],
               order_priorities_id: OrderPriority.find_by(priority: line["Order Priority"]),
               customers_id: Customer.find_by(name: line["Customer Name"]),
               shipments_id: Shipment.find_by(ship_mode: line["Ship Mode"]),
               products_id: Product.find_by(name: line["Product Name"])
               )


end





