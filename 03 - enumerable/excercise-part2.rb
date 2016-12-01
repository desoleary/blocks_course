scores = [83, 71, 92, 64, 98, 87, 75, 69]
scores_doubled = scores.map { |score| score * 2 }
p scores_doubled

total = scores.reduce(0) { |sum, score| sum + score }
puts "Total score: #{total}"

# or use the shortcut

total = scores.reduce(0, :+)
puts "Total score using shortcut: #{total}"

require_relative '../03 - enumerable/flyer'

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

platinum_flyers, other_flyers = flyers.partition{|f|f.status == :platinum}

puts 'Platinum flyers:'
puts platinum_flyers

puts 'Other flyers:'
puts other_flyers

puts 'array containing distances flown by each flyer, expressed in kilometers rather than miles. Make the array and print it out! (To convert miles to kilometers, multiply miles by 1.6.)'

puts totals_in_kms = flyers.map { |f| f.miles_flown * 1.6 }

puts 'Total KMS:'
puts totals_in_kms.reduce(0, :+)

puts 'Bonus Round'

puts 'Tally up all the kilometers flown by bronze flyers'
puts flyers.select{|f|f.status == :bronze}.reduce(0){|sum, order|sum + (order.miles_flown * 1.6)}

# or here's another perfectly-valid solution:

total_bronze_kms_flown = flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6 }.reduce(:+)

top_flyer = flyers.max_by { |f| f.miles_flown }
puts "Top Flyer: #{top_flyer}"