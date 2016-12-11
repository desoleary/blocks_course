require_relative '../01-block-basics/flyer'

flyers = []
1.upto(5) do |number|
  flyers << Flyer.new("Flyer #{number}", "flyer#{number}@example.com", number * 1000)
end

flyers.each do |flyer|
  puts "#{flyer.name} - #{flyer.miles_flown} miles"
end

total = 0
flyers.each do |flyer|
  total += flyer.miles_flown
end

puts "Total miles flown: #{total}"

promotions = {'United' => 1.5, 'Delta' => 2.0, 'Lufthansa' => 2.5 }
promotions.each{|airline, multiplier|puts "Earn #{multiplier}x miles by flying #{airline}!"}

flyers.each do |flyer|
  promotions.each do |airline, multiplier|
    puts "#{flyer.name} could earn #{flyer.miles_flown * multiplier} miles by flying #{airline}!"
  end
end