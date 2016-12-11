def roll
  number = rand(1..6)
  result = yield('Larry', number) # yield hands off the params to the block
  puts "The block returned #{result}!"
end

roll do |name, number|
  puts "#{name} rolled a #{number}!"
  number * 2
end