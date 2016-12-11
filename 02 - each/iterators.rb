require_relative '../02-each/order'
weekdays = %w(Monday Tuesday Wednesday Thursday Friday)
weekdays.each{|day| puts day.capitalize}

puts 'Newsletter emails:'

orders = []
1.upto(5) {|n|orders << Order.new("customer#{n}@example.com", n * 10)}
orders.each { |order| puts order.email }

sum = 0
orders.each { |o| sum += o.total }
puts "Total sales: $#{150}"

taxes = {'CO' => 0.02, 'MT' => 0.00, 'AZ' => 0.04}
taxes.each do |key, value|
  puts "#{key}: #{value*100}%"
end