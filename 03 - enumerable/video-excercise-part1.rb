require_relative '../03 - enumerable/order'

orders = []
orders << Order.new('customer1@example.com', 'MT', 300)
orders << Order.new('customer1@example.com', 'AZ', 400, :completed)
orders << Order.new('customer1@example.com', 'CO', 200)
orders << Order.new('customer1@example.com', 'CO', 100, :completed)

puts orders

puts 'Big orders'

big_orders = orders.select{|o|o.total >= 300}
puts big_orders

puts 'Small orders'

small_orders = orders.reject{|o|o.total >= 300}
puts small_orders

puts orders.any? {|o|o.status == :pending }

puts orders.detect {|o|o.status == :pending} # same as #find