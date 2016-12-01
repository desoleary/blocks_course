require_relative '../03 - enumerable/order'

orders = []
orders << Order.new('customer1@example.com', 'MT', 300)
orders << Order.new('customer2@example.com', 'AZ', 400, :completed)
orders << Order.new('customer3@example.com', 'CO', 200)
orders << Order.new('customer4@example.com', 'CO', 100, :completed)

pending_orders, completed_orders = results = orders.partition { |o| o.status == :pending }
puts 'Pending:'
puts pending_orders

puts 'Completed:'
puts completed_orders

big_orders, small_orders = orders.partition{|o|o.total >= 300}

puts 'Big orders:'
puts big_orders

puts 'Small orders:'
puts small_orders

puts 'Newsletter emails:'
emails = orders.map { |o| o.email.downcase }
p emails

p co_taxes = orders.select{|o|o.state == 'CO'}.map{|o|o.tax}

puts 'Total:'
puts orders.reduce(0){|sum, order|sum + order.total}