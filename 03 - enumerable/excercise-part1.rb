scores = [83, 71, 92, 64, 98, 87, 75, 69]
puts 'High scores'
puts high_scores = scores.select { |s| s > 80 }

puts 'Low scores'
puts low_scores = scores.reject { |s| s > 80 }

puts 'Failing scores?'

puts low_scores.any? { |s| s < 70 }

puts 'First failure'
puts low_scores.find { |s| s < 70 }

require_relative '../03 - enumerable/flyer'

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

puts 'First up, identify your frequent flyer customers—those who have flown at least 3,000 miles and print them out.'

puts frequent_flyers = flyers.select { |f| f.miles_flown >= 3000 }

puts 'What about those flyers who need a few more incentives—those who have flown less than 3,000 miles? Identify and print them, too.'
puts infrequent_flyers = flyers.reject { |f| f.miles_flown >= 3000 }

puts 'Have any of the flyers achieved platinum status? Print the answer.'

puts flyers.any?{|f|f.status == :platinum}

puts "Finally, let's say you want to personally call all of your bronze status flyers to encourage them to move up to silver status. Who's the first flyer on your call list?"

puts first_bronze_flyer = flyers.find{|f|f.status == :bronze}

puts 'Bonus round'

puts 'permanently change the scores array to only include scores greater than 70'

puts scores.select!{|s|s > 70}

puts 'Then permanently kick out all the even scores.'
puts scores.reject! { |s| s.even? }